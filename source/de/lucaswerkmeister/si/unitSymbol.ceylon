import ceylon.language.meta.declaration {
    ValueDeclaration
}

{ValueDeclaration*} undistinguishableUnits = { `value radiant`, `value steradiant`, `value lumen`, `value becquerel`, `value sievert` };

"Attempts to find the symbol of the given value’s unit.
 
 Returns the symbol of the value’s unit if it is a base or derived unit;
 otherwise, returns [[null]].
 
 Note: some units cannot be distinguished from others.
 In these cases,
 - [[null]] (unitless) takes precedence over [[**rad**|radiant]] or [[**sr**|steradiant]],
 - [[**cd**|candela]] takes precedence over [[**lm**|lumen]],
 - [[**Hz**|hertz]] takes precedence over [[**Bq**|becquerel]], and
 - [[**Gy**|gray]] takes precedence over [[**Sv**|sievert]]."
shared String? unitSymbol(SIValue val) {
    for (decl in `package`.annotatedMembers<ValueDeclaration,TagsAnnotation>()) {
        if (decl in undistinguishableUnits) { continue; }
        assert (exists tagsAnno = decl.annotations<TagsAnnotation>().first);
        if ("Units" in tagsAnno.tags) {
            SIValue unit = decl.apply<SIValue>().get();
            if (val.sameUnit(unit)) {
                assert (exists aliasesAnno = decl.annotations<AliasesAnnotation>().first,
                    nonempty aliases = aliasesAnno.aliases);
                return aliases.first;
            }
        }
    } else {
        return null;
    }
}
