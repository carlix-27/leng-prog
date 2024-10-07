type Fraction = (i32, i32);

/// Add 2 fractions
pub fn add((n1, d1): Fraction, (n2, d2): Fraction) -> Fraction {
    let f1 = (n1, d1);
    let f2 = (n2, d2);
    simplify((f1.0 * f2.1) + (f2.0 * f1.1), f1.1 * f2.1)
}

/// Subtract 2 fractions
pub fn sub((n1, d1): Fraction, (n2, d2): Fraction) -> Fraction {
    let f1 = (n1, d1);
    let f2 = (n2, d2);
    simplify((f1.0 * f2.1) - (f2.0 * f1.1), f1.1 * f2.1)
}

/// Multiply 2 fractions
pub fn mul((n1, d1): Fraction, (n2, d2): Fraction) -> Fraction {
    let f1 = (n1, d1);
    let f2 = (n2, d2);
    (f1.0*f2.0, f1.1 * f2.1)
}

/// Divide 2 fractions
pub fn divide((n1, d1): Fraction, (n2, d2): Fraction) -> Fraction {
    let f1 = (n1, d1);
    let f2 = (n2, d2);
    simplify(f1.0 * f2.1, f1.1 * f2.0)
}

/// Calculate the Highest common factor between 2 numbers
pub fn hcf(a: i32, b: i32) -> i32 {
    if b == 0 {
        a
    } else {
        hcf(b, a%b)
    }
}

/// Create a fraction simplifying with the arguments simplified by the `hcf`
pub fn simplify(n: i32, d: i32) -> Fraction {
    let hcf_value = hcf(n , d);
    (n / hcf_value, d / hcf_value)
}
