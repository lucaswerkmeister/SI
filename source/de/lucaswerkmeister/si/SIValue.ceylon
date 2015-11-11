"An SI value.
 
 Each SI value has four components: the mean value, the uncertainty, the exponent, and the unit.
 
 The **[[mean]]** is the mean base value of this [[SIValue]];
 with an [[uncertainty]] of zero, it is the exact base value.
 The mean is multiplied with ten to the power of the [[exponent]] to get the actual value.
 
 The absolute **[[uncertainty]]** is the degree of precision of the [[mean]].
 It is usually interpreted as the standard deviation of a Gaussian distribution,
 also known as *one sigma*.
 For error propagation, the rules for standard deviation of a Gaussian distribution are used,
 i. e., for additive operations, the resulting uncertainty is the square root of the sum of the squares of the input uncertainties,
 and for multiplicative operations, the resulting *relative* uncertainty is the square root of the sum of the squares of the input *relative* uncertainty,
 where a relative uncertainty is derived from the regular (absolute) uncertainty by dividing by the [[mean]]. 
 This propagation is commutative, associative, and leaves the uncertainty untouched if one of the input uncertainties is zero (a precise value).
 (It is assumed that values are uncorrelated, i. e. have a covariance of zero.)
 
 The base-10 **[[exponent]]** is considered part of the unit, and usually (though not necessarily) a multiple of three.
 It corresponds to the SI prefix; for instance, the prefix Mega- is represented through an exponent of 6.
 
 The **unit** is specified as the exponents of the seven SI base units:
 
 - the [[meter|meters]] (or metre), symbol **m**, the unit of length;
 - the [[kilogram|kilograms]], symbol **kg**, the unit of mass;
 - the [[second|seconds]], symbol **s**, the unit of time;
 - the [[ampere|amperes]], symbol **A**, the unit of electric current;
 - the [[kelvin|kelvins]], symbol **K**, the unit of temperature;
 - the [[mole|moles]], symbol **mol**, the unit of amount of substance; and
 - the [[candela|candelas]], symbol **cd**, the unit of luminous intensity.
 
 Additive operations are only legal for values with the same unit (though the [[exponent]] may be different).
 Multiplicative operations are legal for any combination of units; the unit exponents are added (multiplication) or subtracted (division).
 For example, the newton (symbol **N**, the unit of force) may be constructed directly
 ~~~
 SIValue { kilograms = 1; meters = 1; seconds = -2; }
 ~~~
 or by combining the base units individually:
 ~~~
 SIValue { kilograms = 1; }
 * SIValue { meters = 1; }
 / SIValue { seconds = 2; }
 ~~~"
shared class SIValue(mean = 1.0, uncertainty = 0.0, exponent = 0,
    meters = 0, kilograms = 0, seconds = 0, amperes = 0, kelvins = 0, moles = 0, candelas = 0)
        extends Object()
        satisfies Number<SIValue> & Exponentiable<SIValue,Integer> & Scalable<Float,SIValue> {
    
    shared Float mean;
    shared Float uncertainty;
    shared Integer exponent;
    shared Integer meters;
    shared Integer kilograms;
    shared Integer seconds;
    shared Integer amperes;
    shared Integer kelvins;
    shared Integer moles;
    shared Integer candelas;
    
    assert (uncertainty >= 0.0);
    
    "Combine two uncertainties into a new uncertainty,
     for arithmetic operations.
     
     For additive operations, the input uncertainties should be absolute,
     and the output uncertainty should be interpreted as absolute.
     For multiplicative operations, the input uncertainties should be relative
     (absolute, divided by mean), and the output uncertainty should be interpreted as relative
     (for absolute, multiply with mean).
     
     (Save for rounding uncertainties, this is associative and commutative.)"
    Float combineUncertainty(Float uncertainty1, Float uncertainty2)
            => (uncertainty1^2 + uncertainty2^2) ^ 0.5;
    
    shared Boolean sameUnit(SIValue that) {
        return this.meters==that.meters &&
                this.kilograms==that.kilograms &&
                this.seconds==that.seconds &&
                this.amperes==that.amperes &&
                this.kelvins==that.kelvins &&
                this.moles==that.moles &&
                this.candelas==that.candelas;
    }
    
    shared actual SIValue plus(SIValue that) {
        assert (sameUnit(that));
        Integer exponent;
        Float thisMean;
        Float thatMean;
        Float thisUncertainty;
        Float thatUncertainty;
        if (this.exponent <= that.exponent) {
            exponent = this.exponent;
            thisMean = this.mean;
            thisUncertainty = this.uncertainty;
            thatMean = that.mean * 10 ^ (that.exponent - this.exponent);
            thatUncertainty = that.uncertainty * 10 ^ (that.exponent - this.exponent);
        } else {
            exponent = that.exponent;
            thatMean = that.mean;
            thatUncertainty = that.uncertainty;
            thisMean = this.mean * 10 ^ (this.exponent - that.exponent);
            thisUncertainty = this.uncertainty * 10 ^ (this.exponent - that.exponent);
        }
        return SIValue(thisMean + thatMean, combineUncertainty(thisUncertainty, thatUncertainty), exponent,
            meters, kilograms, seconds, amperes, kelvins, moles, candelas);
    }
    
    shared actual SIValue negated
            => SIValue(-mean, uncertainty, exponent, meters, kilograms, seconds, amperes, kelvins, moles, candelas);
    
    shared actual SIValue times(SIValue that)
            => SIValue(this.mean * that.mean,
        this.uncertainty*that.uncertainty == 0.0 then 0.0 else this.mean * that.mean * combineUncertainty(this.uncertainty / this.mean, that.uncertainty / that.mean),
        this.exponent + that.exponent,
        this.meters + that.meters, this.kilograms + that.kilograms, this.seconds + that.seconds,
        this.amperes + that.amperes, this.kelvins + that.kelvins, this.moles + that.moles,
        this.candelas + that.candelas);
    
    shared actual SIValue divided(SIValue that)
            => SIValue(this.mean / that.mean,
        this.uncertainty*that.uncertainty == 0.0 then 0.0 else this.mean / that.mean * combineUncertainty(this.uncertainty / this.mean, that.uncertainty / that.mean),
        this.exponent - that.exponent,
        this.meters - that.meters, this.kilograms - that.kilograms, this.seconds - that.seconds,
        this.amperes - that.amperes, this.kelvins - that.kelvins, this.moles - that.moles,
        this.candelas - that.candelas);
    
    shared actual SIValue scale(Float scalar)
            => SIValue(mean * scalar, uncertainty, exponent,
        meters, kilograms, seconds, amperes, kelvins, moles, candelas);
    
    "Compares the mean and exponent of two SI values.
     In other words, the values 1000 m and 1 km are considered equal by [[compare]],
     even though [[equals]] does not consider them equal.
     This also does not take the [[uncertainty]] into account."
    shared actual Comparison compare(SIValue that) {
        assert (sameUnit(that));
        return this.mean * 10^exponent <=> that.mean * 10^exponent;
    }
    
    shared actual SIValue power(Integer other)
            => SIValue(mean ^ other.float, uncertainty ^ other.float, exponent * other,
        meters * other, kilograms * other, seconds * other, amperes * other, kelvins * other, moles * other, candelas * other);
    
    shared actual Boolean positive => mean.positive;
    shared actual Boolean negative => mean.negative;
    shared actual SIValue wholePart
            => SIValue(mean.wholePart, uncertainty, exponent,
        meters, kilograms, seconds, amperes, kelvins, moles, candelas);
    shared actual SIValue fractionalPart
            => SIValue(mean.fractionalPart, uncertainty, exponent,
        meters, kilograms, seconds, amperes, kelvins, moles, candelas);
    shared actual SIValue plusInteger(Integer integer)
            => plus(SIValue(integer.float));
    shared actual SIValue timesInteger(Integer integer)
            => times(SIValue(integer.float));
    shared actual SIValue powerOfInteger(Integer integer)
            => power(integer);
    
    "Tests whether two SI values are strictly equal.
     
     Note that this notion of equality is not very useful.
     It tests whether two values have exactly the same mean, uncertainty, exponent, and unit,
     without actually interpreting the meaning of the uncertainty and exponent.
     This is necessary because it’s the only notion of equality
     that satisfies the requirements of [[Object.equals]]
     and for which [[hash]] can be implemented correctly;
     however, to compare values, you probably want to use another function instead
     like TODO better function here.
     
     (This is also inconsistent with [[compare]], which takes the exponent into account.)"
    // TODO write that better function (within: probability (0-1) that normal distributed `this` is within boundaries of `that`)
    shared actual Boolean equals(Object that) {
        if (is SIValue that) {
            return this.mean==that.mean
                    && this.uncertainty==that.uncertainty
                    && this.exponent==that.exponent
                    && this.sameUnit(that);
        } else {
            return false;
        }
    }
    shared actual Integer hash => mean.hash + 31 * (uncertainty.hash + 31 * (exponent.hash + 31 * (
                meters.hash + 31 * (kilograms + 31 * (seconds.hash + 31 * (amperes.hash + 31 * (
                                kelvins.hash + 31 * (moles.hash + 31*candelas.hash))))))));
}
