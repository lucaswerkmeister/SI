import de.lucaswerkmeister.si { ... }
import ceylon.test {
    test,
    ignore,
    assertEquals
}

void testUnitSymbol(SIValue unit, String expectedSymbol)
        => assertEquals { expected = expectedSymbol; actual = unitSymbol(unit); };

test
shared void symbolMeter()
        => testUnitSymbol(meter, "m");

test
shared void symbolKilogram()
        => testUnitSymbol(kilogram, "kg");

test
shared void symbolSecond()
        => testUnitSymbol(second, "s");

test
shared void symbolAmpere()
        => testUnitSymbol(ampere, "A");

test
shared void symbolKelvin()
        => testUnitSymbol(kelvin, "K");

test
shared void symbolMole()
        => testUnitSymbol(mole, "mol");

test
shared void symbolCandela()
        => testUnitSymbol(candela, "cd");

test
ignore ("indistinguishable from unitless value")
shared void symbolRadiant()
        => testUnitSymbol(radiant, "rad");

test
ignore ("indistinguishable from unitless value")
shared void symbolSteradiant()
        => testUnitSymbol(steradiant, "sr");

test
shared void symbolHertz()
        => testUnitSymbol(hertz, "Hz");

test
shared void symbolNewton()
        => testUnitSymbol(newton, "N");

test
shared void symbolPascal()
        => testUnitSymbol(pascal, "Pa");

test
shared void symbolJoule()
        => testUnitSymbol(joule, "J");

test
shared void symbolWatt()
        => testUnitSymbol(watt, "W");

test
shared void symbolCoulomb()
        => testUnitSymbol(coulomb, "C");

test
shared void symbolVolt()
        => testUnitSymbol(volt, "V");

test
shared void symbolFarad()
        => testUnitSymbol(farad, "F");

test
shared void symbolOhm()
        => testUnitSymbol(ohm, "Ω");

test
shared void symbolSiemens()
        => testUnitSymbol(siemens, "S");

test
shared void symbolWeber()
        => testUnitSymbol(weber, "Wb");

test
shared void symbolTesla()
        => testUnitSymbol(tesla, "T");

test
shared void symbolHenry()
        => testUnitSymbol(henry, "H");

test
ignore ("indistinguishable from candela")
shared void symbolLumen()
        => testUnitSymbol(lumen, "lm");

test
shared void symbolLux()
        => testUnitSymbol(lux, "lx");

test
ignore ("indistinguishable from Hertz")
shared void symbolBecquerel()
        => testUnitSymbol(becquerel, "Bq");

test
shared void symbolGray()
        => testUnitSymbol(gray, "Gy");

test
ignore ("indistinguishable from Gray")
shared void symbolSievert()
        => testUnitSymbol(sievert, "Sv");

test
shared void symbolKatal()
        => testUnitSymbol(katal, "kat");
