import haxe.ds.Option;
import Sys.println as pp;
import Iso639_1 as Lg;

class Test {
    public static function assertTrue(b:Bool, ?pos:haxe.PosInfos ) : Void 
        if (!b) pp("assertion failed at " + pos.fileName + ":" + pos.lineNumber);
    
    public static function assertFalse(b:Bool, ?pos:haxe.PosInfos ) : Void 
        assertTrue(!b, pos);

    public static function assertSome<T>(opt:Option<T>, ?pos:haxe.PosInfos ) : Void 
        switch opt {
            case Some(_):
            case None: pp("assertion expected Some(..) but got None at " + pos.fileName + ":" + pos.lineNumber);
        }

    public static function assertNone<T>(opt:Option<T>, ?pos:haxe.PosInfos ) : Void 
        switch opt {
            case Some(_): pp("assertion expected None but got Some(..) at " + pos.fileName + ":" + pos.lineNumber);
            case None: 
        }

    public static function assertEquals(s1:String, s2:String, ?pos:haxe.PosInfos ) : Void 
        if (s1 != s2) pp('assertion fail: $s1 != $s2 at ${pos.fileName}:${pos.lineNumber}');

    static final lg = new Lg([ "en" => { en: "ENGLISH", native: "The Language of Shakespeare" }]);

    public static function main() {
        assertFalse(lg.exists("foo"));    // false
        assertTrue(lg.exists("en"));      // true
        switch lg.name("de") {
            case Some(s): assertEquals(s, "German");
            case None: assertTrue(false);
        }
        switch lg.nativeName("de") {
            case Some(s): assertEquals(s, "Deutsch");
            case None: assertTrue(false);
        }
        switch lg.nativeName("el") {
            case Some(s): assertEquals(s, "Ελληνικά");
            case None: assertTrue(false);
        }

        // Check english was correctly overwritten:
        switch lg.nativeName("en") {
            case Some(s): assertEquals(s, "The Language of Shakespeare");
            case None: assertTrue(false);
        }
        switch lg.name("en") {
            case Some(s): assertEquals(s, "ENGLISH");
            case None: assertTrue(false);
        }

        assertNone(lg.isRightToLeft("foo")); // None

        switch lg.isRightToLeft("en") { 
            case Some(b): assertFalse(b);
            case None: assertTrue(false);
        }
        switch lg.isRightToLeft("ar") { 
            case Some(b): assertTrue(b);    // arabic is right to left
            case None: assertTrue(false);
        }
        pp("Tests completed");
    }
}
