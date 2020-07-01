import haxe.ds.Option;

#if tink_pure
import tink.pure.Mapping;
#end

typedef Lg = {
    final code   : String;
    final en     : String;
    final native : String;
    final rtl    : Bool;
}

/**
 * ISO 639-1 defines Two-letter Codes standard for the Representation of names of Languages 
 * It has been confirmed in 2019.
 * This should be straightforward enough.
 * The class is pure to facilitate work with coconut.ui.
 */
@:pure class Iso639_1 {

    #if tink_pure
    final _map : tink.pure.Mapping<String, Lg>;
    #else
    final _map : Map<String, Lg>;
    #end

    public function new(?customized:Map<String, { ?en: String, ?native: String, ?rtl: Bool }>) {   
        var d = [
            "ab" => { rtl: false, en: "Abkhaz", native:"аҧсуа" },
            "aa" => { rtl: false, en: "Afar", native:"Afaraf" },
            "af" => { rtl: false, en: "Afrikaans", native:"Afrikaans" },
            "ak" => { rtl: false, en: "Akan", native:"Akan" },
            "sq" => { rtl: false, en: "Albanian", native:"Shqip" },
            "am" => { rtl: false, en: "Amharic", native:"አማርኛ" },
            "ar" => { rtl: true,  en: "Arabic", native: "العربية" },
            "an" => { rtl: false, en: "Aragonese", native:"Aragonés" },
            "hy" => { rtl: false, en: "Armenian", native:"Հայերեն" },
            "as" => { rtl: false, en: "Assamese", native:"অসমীয়া" },
            "av" => { rtl: false, en: "Avaric", native:"авар мацӀ, магӀарул мацӀ" },
            "ae" => { rtl: false, en: "Avestan", native:"avesta" },
            "ay" => { rtl: false, en: "Aymara", native:"aymar aru" },
            "az" => { rtl: false, en: "Azerbaijani", native:"azərbaycan dili" },
            "bm" => { rtl: false, en: "Bambara", native:"bamanankan" },
            "ba" => { rtl: false, en: "Bashkir", native:"башҡорт теле" },
            "eu" => { rtl: false, en: "Basque", native:"euskara,euskera" },
            "be" => { rtl: false, en: "Belarusian", native:"Беларуская" },
            "bn" => { rtl: false, en: "Bengali", native:"বাংলা" },
            "bh" => { rtl: false, en: "Bihari", native:"भोजपुरी" },
            "bi" => { rtl: false, en: "Bislama", native:"Bislama" },
            "bs" => { rtl: false, en: "Bosnian", native:"bosanski jezik" },
            "br" => { rtl: false, en: "Breton", native:"brezhoneg" },
            "bg" => { rtl: false, en: "Bulgarian", native:"български език" },
            "my" => { rtl: false, en: "Burmese", native:"ဗမာစာ" },
            "ca" => { rtl: false, en: "Catalan,Valencian", native:"Català" },
            "ch" => { rtl: false, en: "Chamorro", native:"Chamoru" },
            "ce" => { rtl: false, en: "Chechen", native:"нохчийн мотт" },
            "ny" => { rtl: false, en: "Chichewa,Chewa,Nyanja", native:"chinyanja,chiCheŵa" },
            "zh" => { rtl: false, en: "Chinese", native:"中文,汉语,漢語" },
            "cv" => { rtl: false, en: "Chuvash", native:"чӑваш чӗлхи" },
            "kw" => { rtl: false, en: "Cornish", native:"Kernewek" },
            "co" => { rtl: false, en: "Corsican", native:"corsu" },
            "cr" => { rtl: false, en: "Cree", native:"ᓀᐦᐃᔭᐍᐏᐣ" },
            "hr" => { rtl: false, en: "Croatian", native:"hrvatski" },
            "cs" => { rtl: false, en: "Czech", native:"česky,čeština" },
            "da" => { rtl: false, en: "Danish", native:"dansk" },
            "dv" => { rtl: true,  en: "Divehi,Dhivehi,Maldivian", native:"ދިވެހި" },
            "nl" => { rtl: false, en: "Dutch", native:"Nederlands,Vlaams" },
            "en" => { rtl: false, en: "English", native:"English" },
            "eo" => { rtl: false, en: "Esperanto", native:"Esperanto" },
            "et" => { rtl: false, en: "Estonian", native:"eesti" },
            "ee" => { rtl: false, en: "Ewe", native:"Eʋegbe" },
            "fo" => { rtl: false, en: "Faroese", native:"føroyskt" },
            "fj" => { rtl: false, en: "Fijian", native:"vosa Vakaviti" },
            "fi" => { rtl: false, en: "Finnish", native:"suomi" },
            "fr" => { rtl: false, en: "French", native:"français" },
            "ff" => { rtl: false, en: "Fula,Fulahr,Pulaarr,Pular", native:"Fulfulde,Pulaar,Pular" },
            "gl" => { rtl: false, en: "Galician", native:"Galego" },
            "ka" => { rtl: false, en: "Georgian", native:"ქართული" },
            "de" => { rtl: false, en: "German", native:"Deutsch" },
            "el" => { rtl: false, en: "Greek", native:"Ελληνικά" },
            "gn" => { rtl: false, en: "Guarani", native:"Avañeẽ" },
            "gu" => { rtl: false, en: "Gujarati", native:"ગુજરાતી" },
            "ht" => { rtl: false, en: "Haitian,Haitian Creole", native:"Kreyòl ayisyen" },
            "ha" => { rtl: true,  en: "Hausa", native:"هَوُسَ" },
            "he" => { rtl: true,  en: "Hebrew", native:"עברית‎"},
            "hz" => { rtl: false, en: "Herero", native:"Otjiherero" },
            "hi" => { rtl: false, en: "Hindi", native:"हिन्दी, हिंदी" },
            "ho" => { rtl: false, en: "Hiri Motu", native:"Hiri Motu" },
            "hu" => { rtl: false, en: "Hungarian", native:"Magyar" },
            "ia" => { rtl: false, en: "Interlingua", native:"Interlingua" },
            "id" => { rtl: false, en: "Indonesian", native:"Bahasa Indonesia" },
            "ie" => { rtl: false, en: "Interlingue", native:"Interlingue" },
            "ga" => { rtl: false, en: "Irish", native:"Gaeilge" },
            "ig" => { rtl: false, en: "Igbo", native:"Asụsụ Igbo" },
            "ik" => { rtl: false, en: "Inupiaq", native:"Iñupiaq,Iñupiatun" },
            "io" => { rtl: false, en: "Ido", native:"Ido" },
            "is" => { rtl: false, en: "Icelandic", native:"Íslenska" },
            "it" => { rtl: false, en: "Italian", native:"Italiano" },
            "iu" => { rtl: false, en: "Inuktitut", native:"ᐃᓄᒃᑎᑐᑦ" },
            "ja" => { rtl: false, en: "Japanese", native:"日本語" },
            "jv" => { rtl: false, en: "Javanese", native:"basa Jawa" },
            "kl" => { rtl: false, en: "Kalaallisut,Greenlandic", native:"kalaallisut" },
            "kn" => { rtl: false, en: "Kannada", native:"ಕನ್ನಡ" },
            "kr" => { rtl: false, en: "Kanuri", native:"Kanuri" },
            "ks" => { rtl: true,  en: "Kashmiri", native:"कश्मीरी"   },
            "kk" => { rtl: false, en: "Kazakh", native:"Қазақ тілі" },
            "km" => { rtl: false, en: "Khmer", native:"ភាសាខ្មែរ" },
            "ki" => { rtl: false, en: "Kikuyu,Gikuyu", native:"Gĩkũyũ" },
            "rw" => { rtl: false, en: "Kinyarwanda", native:"Ikinyarwanda" },
            "ky" => { rtl: false, en: "Kirghiz,Kyrgyz", native:"кыргыз тили" },
            "kv" => { rtl: false, en: "Komi", native:"коми кыв" },
            "kg" => { rtl: false, en: "Kongo", native:"KiKongo" },
            "ko" => { rtl: false, en: "Korean", native:"한국어" },
            "ku" => { rtl: true,  en: "Kurdish", native:"कश्मीरी"   },
            "kj" => { rtl: false, en: "Kwanyama,Kuanyama", native:"Kuanyama" },
            "la" => { rtl: false, en: "Latin", native:"latine" },
            "lb" => { rtl: false, en: "Luxembourgish,Letzeburgesch", native:"Lëtzebuergesch" },
            "lg" => { rtl: false, en: "Luganda", native:"Luganda" },
            "li" => { rtl: false, en: "Limburgish,Limburgan,Limburger", native:"Limburgs" },
            "ln" => { rtl: false, en: "Lingala", native:"Lingála" },
            "lo" => { rtl: false, en: "Lao", native:"ພາສາລາວ" },
            "lt" => { rtl: false, en: "Lithuanian", native:"lietuvių kalba" },
            "lu" => { rtl: false, en: "Luba-Katanga", native:"Kiluba" },
            "lv" => { rtl: false, en: "Latvian", native:"latviešu valoda" },
            "gv" => { rtl: false, en: "Manx", native:"Gaelg,Gailck" },
            "mk" => { rtl: false, en: "Macedonian", native:"македонски јазик" },
            "mg" => { rtl: false, en: "Malagasy", native:"Malagasy fiteny" },
            "ml" => { rtl: false, en: "Malayalam", native:"മലയാളം" },
            "mt" => { rtl: false, en: "Maltese", native:"Malti" },
            "mi" => { rtl: false, en: "Maori", native:"te reo Māori" },
            "mr" => { rtl: false, en: "Marathi", native:"मराठी" },
            "mh" => { rtl: false, en: "Marshallese", native:"Kajin M̧ajeļ" },
            "mn" => { rtl: false, en: "Mongolian", native:"монгол" },
            "na" => { rtl: false, en: "Nauru", native:"Ekakairũ Naoero" },
            "nv" => { rtl: false, en: "Navajo,Navaho", native:"Diné bizaad,Dinékʼehǰí" },
            "nb" => { rtl: false, en: "Norwegian Bokmal", native:"Norsk bokmål" },
            "nd" => { rtl: false, en: "North Ndebele", native:"isiNdebele" },
            "ne" => { rtl: false, en: "Nepali", native:"नेपाली" },
            "ng" => { rtl: false, en: "Ndonga", native:"Owambo" },
            "nn" => { rtl: false, en: "Norwegian Nynorsk", native:"Norsk nynorsk" },
            "no" => { rtl: false, en: "Norwegian", native:"Norsk" },
            "ii" => { rtl: false, en: "Nuosu", native:"ꆈꌠ꒿ Nuosuhxop" },
            "nr" => { rtl: false, en: "South Ndebele", native:"isiNdebele" },
            "oc" => { rtl: false, en: "Occitan", native:"Occitan" },
            "oj" => { rtl: false, en: "Ojibwe,Ojibwa", native:"ᐊᓂᔑᓈᐯᒧᐎᓐ" },
            "cu" => { rtl: false, en: "Old Church Slavonic,Church Slavic,Church Slavonic,Old Bulgarian,Old Slavonic", native:"ѩзыкъ словѣньскъ" },
            "om" => { rtl: false, en: "Oromo", native:"Afaan Oromoo" },
            "or" => { rtl: false, en: "Oriya", native:"ଓଡ଼ିଆ" },
            "os" => { rtl: false, en: "Ossetian,Ossetic", native:"ирон æвзаг" },
            "pa" => { rtl: true,  en: "Panjabi,Punjabi", native:"ਪੰਜਾਬੀ, پنجابی‎" },
            "pi" => { rtl: false, en: "Pali", native:"पाऴि" },
            "fa" => { rtl: true,  en: "Persian", native:"فارسی" },
            "pl" => { rtl: false, en: "Polish", native:"polski" },
            "ps" => { rtl: true,  en: "Pashto,Pushto", native:"پښتو" },
            "pt" => { rtl: false, en: "Portuguese", native:"Português" },
            "qu" => { rtl: false, en: "Quechua", native:"Runa Simi,Kichwa" },
            "rm" => { rtl: false, en: "Romansh", native:"rumantsch grischun" },
            "rn" => { rtl: false, en: "Kirundi", native:"kiRundi" },
            "ro" => { rtl: false, en: "Romanian,Moldavian,Moldovan", native:"română" },
            "ru" => { rtl: false, en: "Russian", native:"русский язык" },
            "sa" => { rtl: false, en: "Sanskrit", native:"संस्कृतम्" },
            "sc" => { rtl: false, en: "Sardinian", native:"sardu" },
            "sd" => { rtl: true,  en: "Sindhi", native:"सिन्धी, سنڌي، سندھی‎" },
            "se" => { rtl: false, en: "Northern Sami", native:"Davvisámegiella" },
            "sm" => { rtl: false, en: "Samoan", native:"gagana faa Samoa" },
            "sg" => { rtl: false, en: "Sango", native:"yângâ tî sängö" },
            "sr" => { rtl: false, en: "Serbian", native:"српски језик" },
            "gd" => { rtl: false, en: "Gaelic", native:"Gàidhlig" },
            "sn" => { rtl: false, en: "Shona", native:"chiShona" },
            "si" => { rtl: false, en: "Sinhala,Sinhalese", native:"සිංහල" },
            "sk" => { rtl: false, en: "Slovak", native:"slovenčina" },
            "sl" => { rtl: false, en: "Slovene", native:"slovenščina" },
            "so" => { rtl: false, en: "Somali", native:"Soomaaliga,af Soomaali" },
            "st" => { rtl: false, en: "Southern Sotho", native:"Sesotho" },
            "es" => { rtl: false, en: "Spanish,Castilian", native:"español,castellano" },
            "su" => { rtl: false, en: "Sundanese", native:"Basa Sunda" },
            "sw" => { rtl: false, en: "Swahili", native:"Kiswahili" },
            "ss" => { rtl: false, en: "Swati", native:"SiSwati" },
            "sv" => { rtl: false, en: "Swedish", native:"svenska" },
            "ta" => { rtl: false, en: "Tamil", native:"தமிழ்" },
            "te" => { rtl: false, en: "Telugu", native:"తెలుగు" },
            "tg" => { rtl: true,  en: "Tajik", native:"тоҷикӣ,toğikī,تاجیکی‎" },
            "th" => { rtl: false, en: "Thai", native:"ไทย" },
            "ti" => { rtl: false, en: "Tigrinya", native:"ትግርኛ" },
            "bo" => { rtl: false, en: "Tibetan Standard,Tibetan,Central", native:"བོད་ཡིག" },
            "tk" => { rtl: false, en: "Turkmen", native:"Türkmen,Түркмен" },
            "tl" => { rtl: false, en: "Tagalog", native:"Wikang Tagalog,ᜏᜒᜃᜅ᜔ ᜆᜄᜎᜓᜄ᜔" },
            "tn" => { rtl: false, en: "Tswana", native:"Setswana" },
            "to" => { rtl: false, en: "Tonga", native:"faka Tonga" },
            "tr" => { rtl: true,  en: "Turkish", native:"Türkçe" },
            "ts" => { rtl: false, en: "Tsonga", native:"Xitsonga" },
            "tt" => { rtl: false, en: "Tatar", native:"татарча,tatarça,تاتارچا‎" },
            "tw" => { rtl: false, en: "Twi", native:"Twi" },
            "ty" => { rtl: false, en: "Tahitian", native:"Reo Tahiti" },
            "ug" => { rtl: true,  en: "Uighur,Uyghur", native:"Uyƣurqə,ئۇيغۇرچە‎" },
            "uk" => { rtl: false, en: "Ukrainian", native:"українська" },
            "ur" => { rtl: true,  en: "Urdu", native:"اردو" },
            "uz" => { rtl: true,  en: "Uzbek", native:"zbek,Ўзбек,أۇزبېك‎" },
            "ve" => { rtl: false, en: "Venda", native:"Tshivenḓa" },
            "vi" => { rtl: false, en: "Vietense", native:"Tiếng Việt" },
            "vo" => { rtl: false, en: "Volapuk", native:"Volapük" },
            "wa" => { rtl: false, en: "Walloon", native:"Walon" },
            "cy" => { rtl: false, en: "Welsh", native:"Cymraeg" },
            "wo" => { rtl: false, en: "Wolof", native:"Wollof" },
            "fy" => { rtl: false, en: "Western Frisian", native:"Frysk" },
            "xh" => { rtl: false, en: "Xhosa", native:"isiXhosa" },
            "yi" => { rtl: true,  en: "Yiddish", native: "ייִדיש‎" },
            "yo" => { rtl: false, en: "Yoruba", native:"Yorùbá" },
            "za" => { rtl: false, en: "Zhuang,Chuang", native:"Saɯ cueŋƅ" }
        ];
        for (k => v in customized) {
            var o = d.get(k);
            if (o == null) throw "No such language " + k + " iso639-1 code";
            if (v.en     != null) o.en       = v.en;
            if (v.native != null) o.native   = v.native;
            if (v.rtl    != null) o.rtl      = v.rtl ;
            d.set(k, o); 
        }
        _map = [ for ( k => v in d )
            k => { 
                code       : k,
                en         : v.en.split(",")[0],
                native     : v.native.split(",")[0],
                rtl        : v.rtl,
            } 
        ];
    }

    public function exists(code:String) : Bool 
        return _map.exists(code);

    public function lg(code:String) : Option<Lg> 
        return _map.exists(code) ? Some(_map.get(code)) : None;

    public function name(code:String) : Option<String> 
        return _map.exists(code) ? Some(_map.get(code).en) : None;

    public function nativeName(code:String) : Option<String> 
        return _map.exists(code) ? Some(_map.get(code).native) : None;

    public function isRightToLeft(code:String) : Option<Bool> 
        return _map.exists(code) ? Some(_map.get(code).rtl) : None;

    /** 
     * List of languages sorted by key.
     * You'll probably want to cache this in your app:
     * @example
     * private static final _iso639_1 = new Iso639_1();
     * public static final lgs : tink.pure.List<Lg> = _iso639_1.array();
     * public inline static function lg(code:String) : haxe.ds.Option<Lg> return _iso639_1.lg(code);
     * @endexample
     */
    public function array() : Array<Lg> {
        var aKeys = [ for (k in _map.keys()) k ];
        function cmp (a:String,b:String):Int { return if (a<b) -1 else if (a>b) 1 else 0; }
        aKeys.sort(cmp); 
        var a = [];
        for (code in aKeys) {
            switch lg(code) {
                case Some(v): a.push(v);
                case None:
            }
        }
        return a;
    }

    public function list() : List<Lg> return Lambda.list(array());

}
