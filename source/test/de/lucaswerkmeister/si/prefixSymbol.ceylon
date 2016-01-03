import de.lucaswerkmeister.si { ... }
import ceylon.test {
    test,
    assertEquals
}

void testPrefixSymbol(SIValue prefix, String expectedPrefix)
        => assertEquals { expected = expectedPrefix; actual = prefixSymbol(prefix); };

test
shared void symbolYocto()
        => testPrefixSymbol(yocto, "y");

test
shared void symbolZepto()
        => testPrefixSymbol(zepto, "z");

test
shared void symbolAtto()
        => testPrefixSymbol(atto, "a");

test
shared void symbolFemto()
        => testPrefixSymbol(femto, "f");

test
shared void symbolPico()
        => testPrefixSymbol(pico, "p");

test
shared void symbolNano()
        => testPrefixSymbol(nano, "n");

test
shared void symbolMicro()
        => testPrefixSymbol(micro, "μ");

test
shared void symbolMilli()
        => testPrefixSymbol(milli, "m");

test
shared void symbolCenti()
        => testPrefixSymbol(centi, "c");

test
shared void symbolDeci()
        => testPrefixSymbol(deci, "d");

test
shared void symbolDeca()
        => testPrefixSymbol(deca, "da");

test
shared void symbolHecto()
        => testPrefixSymbol(hecto, "h");

test
shared void symbolKilo()
        => testPrefixSymbol(kilo, "k");

test
shared void symbolMega()
        => testPrefixSymbol(mega, "M");

test
shared void symbolGiga()
        => testPrefixSymbol(giga, "G");

test
shared void symbolTera()
        => testPrefixSymbol(tera, "T");

test
shared void symbolPeta()
        => testPrefixSymbol(peta, "P");

test
shared void symbolExa()
        => testPrefixSymbol(exa, "E");

test
shared void symbolZetta()
        => testPrefixSymbol(zetta, "Z");

test
shared void symbolYotta()
        => testPrefixSymbol(yotta, "Y");
