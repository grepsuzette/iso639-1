import haxe.ds.Option;

#if tink_pure
import tink.pure.Mapping;
#end

/**
 * ISO 639-1 defines Two-letter Codes standard for the Representation of Names of Languages 
 * It has been confirmed in 2019.
 * This should be straightforward enough.
 */
class Iso639_1 {
    // data are cached there when data(), so no time is taken 
    // initializing a static var if unneeded.
    static var _data : Map<String, { final rtl:Bool; final name:String; final nativeName:String; }>;

    public static function exists(code:String) : Bool 
        return data().exists(code);

    public static function isRightToLeft(code:String) : Option<Bool> 
        return data().exists(code) ? Some(data().get(code).rtl) : None;

    /**
     * Some languages can have several names. 
     * We show split(",")[0] here.
     */
    public static function name(code:String) : Option<String> 
        return data().exists(code) ? Some(data().get(code).name) : None;

    /**
     * Some languages can have several native names. 
     * We show split(",")[0] here.
     */
    public static function nativeName(code:String) : Option<String> 
        return data().exists(code) ? Some(data().get(code).nativeName) : None;

    public static function data() : Map<String, { final rtl:Bool; final name:String; final nativeName:String; }> 
        return _data != null ? _data : _data = [
            "ab" => { rtl: false, name: "Abkhaz", nativeName:"аҧсуа" },
            "aa" => { rtl: false, name: "Afar", nativeName:"Afaraf" },
            "af" => { rtl: false, name: "Afrikaans", nativeName:"Afrikaans" },
            "ak" => { rtl: false, name: "Akan", nativeName:"Akan" },
            "sq" => { rtl: false, name: "Albanian", nativeName:"Shqip" },
            "am" => { rtl: false, name: "Amharic", nativeName:"አማርኛ" },
            "ar" => { rtl: true,  name: "Arabic", nativeName: "العربية" },
            "an" => { rtl: false, name: "Aragonese", nativeName:"Aragonés" },
            "hy" => { rtl: false, name: "Armenian", nativeName:"Հայերեն" },
            "as" => { rtl: false, name: "Assamese", nativeName:"অসমীয়া" },
            "av" => { rtl: false, name: "Avaric", nativeName:"авар мацӀ, магӀарул мацӀ" },
            "ae" => { rtl: false, name: "Avestan", nativeName:"avesta" },
            "ay" => { rtl: false, name: "Aymara", nativeName:"aymar aru" },
            "az" => { rtl: false, name: "Azerbaijani", nativeName:"azərbaycan dili" },
            "bm" => { rtl: false, name: "Bambara", nativeName:"bamanankan" },
            "ba" => { rtl: false, name: "Bashkir", nativeName:"башҡорт теле" },
            "eu" => { rtl: false, name: "Basque", nativeName:"euskara,euskera" },
            "be" => { rtl: false, name: "Belarusian", nativeName:"Беларуская" },
            "bn" => { rtl: false, name: "Bengali", nativeName:"বাংলা" },
            "bh" => { rtl: false, name: "Bihari", nativeName:"भोजपुरी" },
            "bi" => { rtl: false, name: "Bislama", nativeName:"Bislama" },
            "bs" => { rtl: false, name: "Bosnian", nativeName:"bosanski jezik" },
            "br" => { rtl: false, name: "Breton", nativeName:"brezhoneg" },
            "bg" => { rtl: false, name: "Bulgarian", nativeName:"български език" },
            "my" => { rtl: false, name: "Burmese", nativeName:"ဗမာစာ" },
            "ca" => { rtl: false, name: "Catalan,Valencian", nativeName:"Català" },
            "ch" => { rtl: false, name: "Chamorro", nativeName:"Chamoru" },
            "ce" => { rtl: false, name: "Chechen", nativeName:"нохчийн мотт" },
            "ny" => { rtl: false, name: "Chichewa,Chewa,Nyanja", nativeName:"chinyanja,chiCheŵa" },
            "zh" => { rtl: false, name: "Chinese", nativeName:"中文,汉语,漢語" },
            "cv" => { rtl: false, name: "Chuvash", nativeName:"чӑваш чӗлхи" },
            "kw" => { rtl: false, name: "Cornish", nativeName:"Kernewek" },
            "co" => { rtl: false, name: "Corsican", nativeName:"corsu" },
            "cr" => { rtl: false, name: "Cree", nativeName:"ᓀᐦᐃᔭᐍᐏᐣ" },
            "hr" => { rtl: false, name: "Croatian", nativeName:"hrvatski" },
            "cs" => { rtl: false, name: "Czech", nativeName:"česky,čeština" },
            "da" => { rtl: false, name: "Danish", nativeName:"dansk" },
            "dv" => { rtl: true,  name: "Divehi,Dhivehi,Maldivian", nativeName:"ދިވެހި" },
            "nl" => { rtl: false, name: "Dutch", nativeName:"Nederlands,Vlaams" },
            "en" => { rtl: false, name: "English", nativeName:"English" },
            "eo" => { rtl: false, name: "Esperanto", nativeName:"Esperanto" },
            "et" => { rtl: false, name: "Estonian", nativeName:"eesti" },
            "ee" => { rtl: false, name: "Ewe", nativeName:"Eʋegbe" },
            "fo" => { rtl: false, name: "Faroese", nativeName:"føroyskt" },
            "fj" => { rtl: false, name: "Fijian", nativeName:"vosa Vakaviti" },
            "fi" => { rtl: false, name: "Finnish", nativeName:"suomi" },
            "fr" => { rtl: false, name: "French", nativeName:"français" },
            "ff" => { rtl: false, name: "Fula,Fulahr,Pulaarr,Pular", nativeName:"Fulfulde,Pulaar,Pular" },
            "gl" => { rtl: false, name: "Galician", nativeName:"Galego" },
            "ka" => { rtl: false, name: "Georgian", nativeName:"ქართული" },
            "de" => { rtl: false, name: "German", nativeName:"Deutsch" },
            "el" => { rtl: false, name: "Greek", nativeName:"Ελληνικά" },
            "gn" => { rtl: false, name: "Guarani", nativeName:"Avañeẽ" },
            "gu" => { rtl: false, name: "Gujarati", nativeName:"ગુજરાતી" },
            "ht" => { rtl: false, name: "Haitian,Haitian Creole", nativeName:"Kreyòl ayisyen" },
            "ha" => { rtl: true,  name: "Hausa", nativeName:"هَوُسَ" },
            "he" => { rtl: true,  name: "Hebrew", nativeName:"עברית‎"},
            "hz" => { rtl: false, name: "Herero", nativeName:"Otjiherero" },
            "hi" => { rtl: false, name: "Hindi", nativeName:"हिन्दी, हिंदी" },
            "ho" => { rtl: false, name: "Hiri Motu", nativeName:"Hiri Motu" },
            "hu" => { rtl: false, name: "Hungarian", nativeName:"Magyar" },
            "ia" => { rtl: false, name: "Interlingua", nativeName:"Interlingua" },
            "id" => { rtl: false, name: "Indonesian", nativeName:"Bahasa Indonesia" },
            "ie" => { rtl: false, name: "Interlingue", nativeName:"Interlingue" },
            "ga" => { rtl: false, name: "Irish", nativeName:"Gaeilge" },
            "ig" => { rtl: false, name: "Igbo", nativeName:"Asụsụ Igbo" },
            "ik" => { rtl: false, name: "Inupiaq", nativeName:"Iñupiaq,Iñupiatun" },
            "io" => { rtl: false, name: "Ido", nativeName:"Ido" },
            "is" => { rtl: false, name: "Icelandic", nativeName:"Íslenska" },
            "it" => { rtl: false, name: "Italian", nativeName:"Italiano" },
            "iu" => { rtl: false, name: "Inuktitut", nativeName:"ᐃᓄᒃᑎᑐᑦ" },
            "ja" => { rtl: false, name: "Japanese", nativeName:"日本語" },
            "jv" => { rtl: false, name: "Javanese", nativeName:"basa Jawa" },
            "kl" => { rtl: false, name: "Kalaallisut,Greenlandic", nativeName:"kalaallisut" },
            "kn" => { rtl: false, name: "Kannada", nativeName:"ಕನ್ನಡ" },
            "kr" => { rtl: false, name: "Kanuri", nativeName:"Kanuri" },
            "ks" => { rtl: true,  name: "Kashmiri", nativeName:"कश्मीरी"   },
            "kk" => { rtl: false, name: "Kazakh", nativeName:"Қазақ тілі" },
            "km" => { rtl: false, name: "Khmer", nativeName:"ភាសាខ្មែរ" },
            "ki" => { rtl: false, name: "Kikuyu,Gikuyu", nativeName:"Gĩkũyũ" },
            "rw" => { rtl: false, name: "Kinyarwanda", nativeName:"Ikinyarwanda" },
            "ky" => { rtl: false, name: "Kirghiz,Kyrgyz", nativeName:"кыргыз тили" },
            "kv" => { rtl: false, name: "Komi", nativeName:"коми кыв" },
            "kg" => { rtl: false, name: "Kongo", nativeName:"KiKongo" },
            "ko" => { rtl: false, name: "Korean", nativeName:"한국어" },
            "ku" => { rtl: true,  name: "Kurdish", nativeName:"कश्मीरी"   },
            "kj" => { rtl: false, name: "Kwanyama,Kuanyama", nativeName:"Kuanyama" },
            "la" => { rtl: false, name: "Latin", nativeName:"latine" },
            "lb" => { rtl: false, name: "Luxembourgish,Letzeburgesch", nativeName:"Lëtzebuergesch" },
            "lg" => { rtl: false, name: "Luganda", nativeName:"Luganda" },
            "li" => { rtl: false, name: "Limburgish,Limburgan,Limburger", nativeName:"Limburgs" },
            "ln" => { rtl: false, name: "Lingala", nativeName:"Lingála" },
            "lo" => { rtl: false, name: "Lao", nativeName:"ພາສາລາວ" },
            "lt" => { rtl: false, name: "Lithuanian", nativeName:"lietuvių kalba" },
            "lu" => { rtl: false, name: "Luba-Katanga", nativeName:"Kiluba" },
            "lv" => { rtl: false, name: "Latvian", nativeName:"latviešu valoda" },
            "gv" => { rtl: false, name: "Manx", nativeName:"Gaelg,Gailck" },
            "mk" => { rtl: false, name: "Macedonian", nativeName:"македонски јазик" },
            "mg" => { rtl: false, name: "Malagasy", nativeName:"Malagasy fiteny" },
            "ml" => { rtl: false, name: "Malayalam", nativeName:"മലയാളം" },
            "mt" => { rtl: false, name: "Maltese", nativeName:"Malti" },
            "mi" => { rtl: false, name: "Maori", nativeName:"te reo Māori" },
            "mr" => { rtl: false, name: "Marathi", nativeName:"मराठी" },
            "mh" => { rtl: false, name: "Marshallese", nativeName:"Kajin M̧ajeļ" },
            "mn" => { rtl: false, name: "Mongolian", nativeName:"монгол" },
            "na" => { rtl: false, name: "Nauru", nativeName:"Ekakairũ Naoero" },
            "nv" => { rtl: false, name: "Navajo,Navaho", nativeName:"Diné bizaad,Dinékʼehǰí" },
            "nb" => { rtl: false, name: "Norwegian Bokmal", nativeName:"Norsk bokmål" },
            "nd" => { rtl: false, name: "North Ndebele", nativeName:"isiNdebele" },
            "ne" => { rtl: false, name: "Nepali", nativeName:"नेपाली" },
            "ng" => { rtl: false, name: "Ndonga", nativeName:"Owambo" },
            "nn" => { rtl: false, name: "Norwegian Nynorsk", nativeName:"Norsk nynorsk" },
            "no" => { rtl: false, name: "Norwegian", nativeName:"Norsk" },
            "ii" => { rtl: false, name: "Nuosu", nativeName:"ꆈꌠ꒿ Nuosuhxop" },
            "nr" => { rtl: false, name: "South Ndebele", nativeName:"isiNdebele" },
            "oc" => { rtl: false, name: "Occitan", nativeName:"Occitan" },
            "oj" => { rtl: false, name: "Ojibwe,Ojibwa", nativeName:"ᐊᓂᔑᓈᐯᒧᐎᓐ" },
            "cu" => { rtl: false, name: "Old Church Slavonic,Church Slavic,Church Slavonic,Old Bulgarian,Old Slavonic", nativeName:"ѩзыкъ словѣньскъ" },
            "om" => { rtl: false, name: "Oromo", nativeName:"Afaan Oromoo" },
            "or" => { rtl: false, name: "Oriya", nativeName:"ଓଡ଼ିଆ" },
            "os" => { rtl: false, name: "Ossetian,Ossetic", nativeName:"ирон æвзаг" },
            "pa" => { rtl: true,  name: "Panjabi,Punjabi", nativeName:"ਪੰਜਾਬੀ, پنجابی‎" },
            "pi" => { rtl: false, name: "Pali", nativeName:"पाऴि" },
            "fa" => { rtl: true,  name: "Persian", nativeName:"فارسی" },
            "pl" => { rtl: false, name: "Polish", nativeName:"polski" },
            "ps" => { rtl: true,  name: "Pashto,Pushto", nativeName:"پښتو" },
            "pt" => { rtl: false, name: "Portuguese", nativeName:"Português" },
            "qu" => { rtl: false, name: "Quechua", nativeName:"Runa Simi,Kichwa" },
            "rm" => { rtl: false, name: "Romansh", nativeName:"rumantsch grischun" },
            "rn" => { rtl: false, name: "Kirundi", nativeName:"kiRundi" },
            "ro" => { rtl: false, name: "Romanian,Moldavian,Moldovan", nativeName:"română" },
            "ru" => { rtl: false, name: "Russian", nativeName:"русский язык" },
            "sa" => { rtl: false, name: "Sanskrit", nativeName:"संस्कृतम्" },
            "sc" => { rtl: false, name: "Sardinian", nativeName:"sardu" },
            "sd" => { rtl: true,  name: "Sindhi", nativeName:"सिन्धी, سنڌي، سندھی‎" },
            "se" => { rtl: false, name: "Northern Sami", nativeName:"Davvisámegiella" },
            "sm" => { rtl: false, name: "Samoan", nativeName:"gagana faa Samoa" },
            "sg" => { rtl: false, name: "Sango", nativeName:"yângâ tî sängö" },
            "sr" => { rtl: false, name: "Serbian", nativeName:"српски језик" },
            "gd" => { rtl: false, name: "Gaelic", nativeName:"Gàidhlig" },
            "sn" => { rtl: false, name: "Shona", nativeName:"chiShona" },
            "si" => { rtl: false, name: "Sinhala,Sinhalese", nativeName:"සිංහල" },
            "sk" => { rtl: false, name: "Slovak", nativeName:"slovenčina" },
            "sl" => { rtl: false, name: "Slovene", nativeName:"slovenščina" },
            "so" => { rtl: false, name: "Somali", nativeName:"Soomaaliga,af Soomaali" },
            "st" => { rtl: false, name: "Southern Sotho", nativeName:"Sesotho" },
            "es" => { rtl: false, name: "Spanish,Castilian", nativeName:"español,castellano" },
            "su" => { rtl: false, name: "Sundanese", nativeName:"Basa Sunda" },
            "sw" => { rtl: false, name: "Swahili", nativeName:"Kiswahili" },
            "ss" => { rtl: false, name: "Swati", nativeName:"SiSwati" },
            "sv" => { rtl: false, name: "Swedish", nativeName:"svenska" },
            "ta" => { rtl: false, name: "Tamil", nativeName:"தமிழ்" },
            "te" => { rtl: false, name: "Telugu", nativeName:"తెలుగు" },
            "tg" => { rtl: true,  name: "Tajik", nativeName:"тоҷикӣ,toğikī,تاجیکی‎" },
            "th" => { rtl: false, name: "Thai", nativeName:"ไทย" },
            "ti" => { rtl: false, name: "Tigrinya", nativeName:"ትግርኛ" },
            "bo" => { rtl: false, name: "Tibetan Standard,Tibetan,Central", nativeName:"བོད་ཡིག" },
            "tk" => { rtl: false, name: "Turkmen", nativeName:"Türkmen,Түркмен" },
            "tl" => { rtl: false, name: "Tagalog", nativeName:"Wikang Tagalog,ᜏᜒᜃᜅ᜔ ᜆᜄᜎᜓᜄ᜔" },
            "tn" => { rtl: false, name: "Tswana", nativeName:"Setswana" },
            "to" => { rtl: false, name: "Tonga", nativeName:"faka Tonga" },
            "tr" => { rtl: true,  name: "Turkish", nativeName:"Türkçe" },
            "ts" => { rtl: false, name: "Tsonga", nativeName:"Xitsonga" },
            "tt" => { rtl: false, name: "Tatar", nativeName:"татарча,tatarça,تاتارچا‎" },
            "tw" => { rtl: false, name: "Twi", nativeName:"Twi" },
            "ty" => { rtl: false, name: "Tahitian", nativeName:"Reo Tahiti" },
            "ug" => { rtl: true,  name: "Uighur,Uyghur", nativeName:"Uyƣurqə,ئۇيغۇرچە‎" },
            "uk" => { rtl: false, name: "Ukrainian", nativeName:"українська" },
            "ur" => { rtl: true,  name: "Urdu", nativeName:"اردو" },
            "uz" => { rtl: true,  name: "Uzbek", nativeName:"zbek,Ўзбек,أۇزبېك‎" },
            "ve" => { rtl: false, name: "Venda", nativeName:"Tshivenḓa" },
            "vi" => { rtl: false, name: "Vietnamese", nativeName:"Tiếng Việt" },
            "vo" => { rtl: false, name: "Volapuk", nativeName:"Volapük" },
            "wa" => { rtl: false, name: "Walloon", nativeName:"Walon" },
            "cy" => { rtl: false, name: "Welsh", nativeName:"Cymraeg" },
            "wo" => { rtl: false, name: "Wolof", nativeName:"Wollof" },
            "fy" => { rtl: false, name: "Western Frisian", nativeName:"Frysk" },
            "xh" => { rtl: false, name: "Xhosa", nativeName:"isiXhosa" },
            "yi" => { rtl: true,  name: "Yiddish", nativeName: "ייִדיש‎" },
            "yo" => { rtl: false, name: "Yoruba", nativeName:"Yorùbá" },
            "za" => { rtl: false, name: "Zhuang,Chuang", nativeName:"Saɯ cueŋƅ" }
    ];

    /**
     * To customize some names for defined symbols.
     * Though the base list is probably complete enough, 
     * you may want to modify some names yourself, depending on the needs and tone
     * of your application's business. 
     *
     * For instance, for chinese nativeName is defined in the standard as "中文,汉语,漢語"
     * (litterally "Culture of the Middle" and "Language of the Hans" written once in simplified
     * characters and once this time in traditional characters (used in HK, Taiwan, Macau etc). 
     *
     * Iso639_1.nativeName("zh") will merely give back the first answer "中文".
     * You can overwrite that in you app, e.g. `Iso639_1.overwriteNativeName("zh", "汉语");`
     * Likewise there is a `overwriteName` method.
     */
    public static function overwriteName(code:String, name:String) : Void {
        var v = data().get(code);
        if (v == null) throw "No such language " + code + " iso639-1 code";
        _data.set(code, { rtl: v.rtl, name: name, nativeName: v.nativeName});
    }

    public static function overwriteNativeName(code:String, nativeName:String) : Void {
        var v = data().get(code);
        if (v == null) throw "No such language " + code + " iso639-1 code";
        _data.set(code, { rtl: v.rtl, name: v.name, nativeName: nativeName});
    }
}
