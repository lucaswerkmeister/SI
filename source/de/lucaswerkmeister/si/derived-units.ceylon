"The radiant, symbol **rad**, is the unit of angle."
tagged ("Units", "Derived Units")
aliased ("rad")
shared SIValue radiant = SIValue();

"The steradiant, symbol **sr**, is the unit of solid angle."
tagged ("Units", "Derived Units")
aliased ("sr")
shared SIValue steradiant = SIValue();

"The hertz, symbol **Hz**, is the unit of frequency."
tagged ("Units", "Derived Units")
aliased ("Hz")
shared SIValue hertz = SIValue { seconds = -1; };

"The newton, symbol **N**, is the unit of force and weight."
tagged ("Units", "Derived Units")
aliased ("N")
shared SIValue newton = SIValue { meters = 1; kilograms = 1; seconds = -2; };

"The pascal, symbol **Pa**, is the unit of pressure and stress."
tagged ("Units", "Derived Units")
aliased ("Pa")
shared SIValue pascal = SIValue { meters = -1; kilograms = 1; seconds = -2; };

"The joule, symbol **J**, is the unit of energy, work, and heat."
tagged ("Units", "Derived Units")
aliased ("J")
shared SIValue joule = SIValue { meters = 2; kilograms = 1; seconds = -2; };

"The watt, symbol **W**, is the unit of power and radiant flux."
tagged ("Units", "Derived Units")
aliased ("W")
shared SIValue watt = SIValue { meters = 2; kilograms = 1; seconds = -3; };

"The coulomb, symbol **C**, is the unit of electric charge or quantity of electricity."
tagged ("Units", "Derived Units")
aliased ("C")
shared SIValue coulomb = SIValue { seconds = 1; amperes = 1; };

"The volt, symbol **V**, is the unit of electric potential, electric potential difference and electromotive force."
tagged ("Units", "Derived Units")
aliased ("V")
shared SIValue volt = SIValue { meters = 2; kilograms = 1; seconds = -3; amperes = -1; };

"The farad, symbol **F**, is the unit of electric capacitance."
tagged ("Units", "Derived Units")
aliased ("F")
shared SIValue farad = SIValue { meters = -2; kilograms = -1; seconds = 4; amperes = 2; };

"The ohm, symbol **Ω**, is the unit of electric resistance, impedance, and reactance."
tagged ("Units", "Derived Units")
aliased ("Ω")
shared SIValue ohm = SIValue  { meters = 2; kilograms = 1; seconds = -3; amperes = -2; };

"The siemens, symbol **S**, is the unit of electrical conductance and admittance."
tagged ("Units", "Derived Units")
aliased ("S")
shared SIValue siemens = SIValue { meters = -2; kilograms = -1; seconds = 3; amperes = 2; };

"The weber, symbol **Wb**, is the unit of magnetic flux."
tagged ("Units", "Derived Units")
aliased ("Wb")
shared SIValue weber = SIValue { meters = 2; kilograms = 1; seconds = -2; amperes = -1; };

"The tesla, symbol **T**, is the unit of magnetic field strength."
tagged ("Units", "Derived Units")
aliased ("T")
shared SIValue tesla = SIValue { kilograms = 1; seconds = -2; amperes = -1; };

"The henry, symbol **H**, is the unit of inductance."
tagged ("Units", "Derived Units")
aliased ("H")
shared SIValue henry = SIValue { meters = 2; kilograms = 1; seconds = -2; amperes = -2; };

// TODO celsius?

"The lumen, symbol **lm**, is the unit of luminous flux."
tagged ("Units", "Derived Units")
aliased ("lm")
shared SIValue lumen = SIValue { candelas = 1; }; // cd * sr

"The lux, symbol **lx**, is the unit of illuminance and luminous emittance."
tagged ("Units", "Derived Units")
aliased ("lx")
shared SIValue lux = SIValue { meters = -2; candelas = 1; };

"The becquerel, symbol **Bq**, is the unit of radioactivity."
tagged ("Units", "Derived Units")
aliased ("Bq")
shared SIValue becquerel = SIValue { seconds = -1; };

"The gray, symbol **Gy**, is the unit of absorbed ionizing radiation dose."
tagged ("Units", "Derived Units")
aliased ("Gy")
shared SIValue gray = SIValue { meters = 2; seconds = -2; };

"The sievert, symbol **Sv**, is the unit of equivalent ionizing radiation dose."
tagged ("Units", "Derived Units")
aliased ("Sv")
shared SIValue sievert = SIValue { meters = 2; seconds = -2; };

"The katal, symbol **kat**, is the unit of catalytic activity."
tagged ("Units", "Derived Units")
aliased ("kat")
shared SIValue katal = SIValue { seconds = -1; moles = 1; };
