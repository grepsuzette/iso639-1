# Haxe Iso639-1 class

ISO 639-1 defines Two-letter Codes standard for the Representation of Names of
Languages. It has been (re-)confirmed in 2019, so, like Intel vulns, it is here to stay. 
https://wikipedia.org/wiki/ISO_639-1

It defines the following codes for Haxe:

ab aa af ak sq am ar an hy as av ae ay az bm ba eu be bn bh bi bs br bg my ca
ch ce ny zh cv kw co cr hr cs da dv nl en eo et ee fo fj fi fr ff gl ka de el
gn gu ht ha he hz hi ho hu ia id ie ga ig ik io is it iu ja jv kl kn kr ks kk
km ki rw ky kv kg ko ku kj la lb lg li ln lo lt lu lv gv mk mg ml mt mi mr mh
mn na nv nb nd ne ng nn no ii nr oc oj cu om or os pa pi fa pl ps pt qu rm rn
ro ru sa sc sd se sm sg sr gd sn si sk sl so st es su sw ss sv ta te tg th ti
bo tk tl tn to tr ts tt tw ty ug uk ur uz ve vi vo wa cy wo fy xh yi yo za zh

And associates them to:

* an english **language name**, e.g. "Finnish"
* a **nativeName**, e.g. "suomi",
* a **rtf** Bool (i.e. is it right-to-left language).

This class is **@:pure**, i.e. devoid of side-effects (see below).

# Example 

```haxe
var lg = new Iso639_1();
lg.exists("en");         // true
lg.exists("foo");        // false
lg.name("de");           // Some("german")
lg.nativeName("el");     // Some("Ελληνικά")
lg.isRightToLeft("foo"); // None
lg.isRightToLeft("ar");  // Some(true)

lg.lg("en");             // Some(Lg)
```

`Lg` is defined as:

```haxe
typedef Lg = {
    final code   : String;  // "el"
    final en     : String;  // "greek"
    final native : String;  // "Ελληνικά"
    final rtl    : Bool;    // false
}
```

# Purity

The class is always **pure** (side-effect free). Object once built is read-only.

If the [tink_pure](https://github.com/haxetink/tink_pure) library is used in your project, the class internally uses `tink.pure.Mapping` instead of a `haxe Map`. This is probably useless, it only prevents theorical possible modification to it using `@:privateAccess`.

Some mappings like this can be useful in your code, e.g. in a coconut app:

```haxe
import Iso639_1;
...
private static final _iso639_1 = new Iso639_1();
public static final lgs : tink.pure.List<Lg> = _iso639_1.array();
public inline static function lg(code:String) : haxe.ds.Option<Lg> return _iso639_1.lg(code);
```

Then you've got a pure list of `Lg` called `lgs`, and a method `lg(code:String):Option<Lg>` to work with, where `Lg` is pure and you don't need to mess with the class itself anymore, everything is in `Lg`.

# Customizing the list

Though the base list is normally as complete as the ISO standard is at the moment, 
you may want to modify some names yourself depending on the needs and tone
of your application. 

For instance, chinese `native` could be wanted to be expressed as "汉语" or
"漢語" instead of as "中文" as it is now...

You can make special modifications like this when you first instantiate an object
(preferably once in your app):

```haxe
var lg = new Iso639_1( [ "zh" => { native: "汉语" } ] );   
```

All keys you try to redefine must exist in the standard.
The **constructor** signature is:

```haxe
function new(?customized:Map<String, { ?en: String, ?native: String, ?rtl: Bool }>)
```

With:
```haxe
{
    ?en     : String,    // the name of the language in english (e.g. "japanese“)
    ?native : String,    // the name of the language in itself (e.g. "日本語“)
    ?rtl    : Bool,      // right-to-left language? The only case when you would want 
                         //   to customize that is if you discover the current data
                         //   has invalid value of rtl for one of the languages.
}
```

For instance:

```haxe
final lg = new Iso639_1([
    "en" => { native: "The Language of Shakespeare" }, 
    "zh" => { native: "汉语", en: "Chinese (simplified)", rtl: false },
]);
```

That's all for now, have fun.
