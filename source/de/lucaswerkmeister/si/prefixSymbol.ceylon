import ceylon.language.meta.declaration {
    ValueDeclaration
}

"Attempts to find the prefix symbol of the given value’s exponent.
 
 Returns the prefix symbol of the value’s exponent if a prefix for the exponent exists;
 otherwise, returns [[null]]."
shared String? prefixSymbol(SIValue val) {
    for (decl in `package`.annotatedMembers<ValueDeclaration,TagsAnnotation>()) {
        assert (exists tagsAnno = decl.annotations<TagsAnnotation>().first);
        if ("Prefixes" in tagsAnno.tags) {
            SIValue prefix = decl.apply<SIValue>().get();
            if (val.exponent == prefix.exponent) {
                assert (exists aliasesAnno = decl.annotations<AliasesAnnotation>().first,
                    nonempty aliases = aliasesAnno.aliases);
                return aliases.first;
            }
        }
    } else {
        return null;
    }
}
