# Haxe Iso639-1 class

ISO 639-1 defines Two-letter Codes standard for the Representation of Names of
Languages. It has been (re-)confirmed in 2019, so, like Intel bugs, it is here to stay. 
https://wikipedia.org/wiki/ISO_639-1

It defines the following codes for Haxe:

ab aa af ak sq am ar an hy as av ae ay az bm ba eu be bn bh bi bs br bg my ca
ch ce ny zh cv kw co cr hr cs da dv nl en eo et ee fo fj fi fr ff gl ka de el
gn gu ht ha he hz hi ho hu ia id ie ga ig ik io is it iu ja jv kl kn kr ks kk
km ki rw ky kv kg ko ku kj la lb lg li ln lo lt lu lv gv mk mg ml mt mi mr mh
mn na nv nb nd ne ng nn no ii nr oc oj cu om or os pa pi fa pl ps pt qu rm rn
ro ru sa sc sd se sm sg sr gd sn si sk sl so st es su sw ss sv ta te tg th ti
bo tk tl tn to tr ts tt tw ty ug uk ur uz ve vi vo wa cy wo fy xh yi yo za

And associates them to:

* an english **language name**, e.g. "Finnish"
* a **nativeName**, e.g. "suomi",
* a **rtf** Bool (i.e. is it right-to-left language).

## Example 

```haxe
Iso639_1.exists("foo");     // false
Iso639_1.exists("en");      // true
Iso639_1.name("de");        // Some("german")
Iso639_1.nativeName("el");  // Some("Ελληνικά")
Iso639_1.isRightToLeft("foo"); // None
Iso639_1.isRightToLeft("ar");  // Some(true)
```

There is 1 class, so we didn't place it in a namespace.
But the name `Iso639_1` can be irritating, therefore you
can import it as an alias:

```haxe
import Iso639_1 as Lg;

Lg.isRightToLeft("foo");    // None
Lg.isRightToLeft("en");     // Some(true)
Lg.isRightToLeft("ar");     // Some(true)

Lg.name("de");              // Some("german")
Lg.nativeName("de");        // Some("Deutsch")
```

# Customize the list

Though the base list is probably complete enough, 
you may want to modify some names yourself, depending on the needs and tone
of your application's business. 

For instance, for chinese nativeName is defined in the standard as "中文,汉语,漢語"
(litterally "Culture of the Middle", "Language of the hans" (in simplified
characters) and the same in traditional characters (used in HK, Taiwan,
Macau etc). 

`Iso639_1.nativeName("zh")` will merely give back the first answer "中文".
You can overwrite that in you app, e.g. `Iso639_1.overwriteNativeName("zh", "汉语");`
Likewise there is a `overwriteName` method.



That's all for now, have fun.
