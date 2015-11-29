import de.lucaswerkmeister.si { ... }
import ceylon.test {
    test,
    assertEquals
}

test
shared void derivedRadiant() {
    assertEquals {
        expected = radiant;
        actual = meter / meter;
    };
}

test
shared void derivedSteradiant() {
    assertEquals {
        expected = steradiant;
        actual = meter^2 / meter^2;
    };
}

test
shared void derivedPascal() {
    assertEquals {
        expected = pascal;
        actual = newton / meter^2;
    };
}

test
shared void derivedJoule() {
    assertEquals {
        expected = joule;
        actual = newton * meter;
    };
    assertEquals {
        expected = joule;
        actual = watt * second;
    };
}

test
shared void derivedWatt() {
    assertEquals {
        expected = watt;
        actual = joule / second;
    };
    assertEquals {
        expected = watt;
        actual = volt * ampere;
    };
}

test
shared void derivedCoulomb() {
    assertEquals {
        expected = coulomb;
        actual = ampere * second;
    };
}

test
shared void derivedVolt() {
    assertEquals {
        expected = volt;
        actual = watt / ampere;
    };
    assertEquals {
        expected = volt;
        actual = joule / coulomb;
    };
}

test
shared void derivedFarad() {
    assertEquals {
        expected = farad;
        actual = coulomb / volt;
    };
}

test
shared void derivedOhm() {
    assertEquals {
        expected = ohm;
        actual = volt / ampere;
    };
}

test
shared void derivedSiemens() {
    assertEquals {
        expected = siemens;
        actual = SIValue(1.0) / ohm;
    };
}

test
shared void derivedWeber() {
    assertEquals {
        expected = weber;
        actual = volt * second;
    };
}

test
shared void derivedTesla() {
    assertEquals {
        expected = tesla;
        actual = weber / meter^2;
    };
}

test
shared void derivedHenry() {
    assertEquals {
        expected = henry;
        actual = weber / ampere;
    };
}

// TODO celsius?

test
shared void derivedLumen() {
    assertEquals {
        expected = lumen;
        actual = candela * steradiant;
    };
}

test
shared void derivedLux() {
    assertEquals {
        expected = lux;
        actual = lumen / meter^2;
    };
}

test
shared void derivedGray() {
    assertEquals {
        expected = gray;
        actual = joule / kilogram;
    };
}

test
shared void derivedSievert() {
    assertEquals {
        expected = sievert;
        actual = joule / kilogram;
    };
}
