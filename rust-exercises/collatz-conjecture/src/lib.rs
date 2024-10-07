
pub fn collatz(n: u64) -> Option<u64> {
    collatz_aux(n, 0)
}

pub fn collatz_aux(n: u64, steps: u64) -> Option<u64>{
    if n <= 0 {
        None
    } else if n == 1 {
        Some(steps)
    } else if check_parity(n) == true {
        collatz_aux(n/2, steps + 1)

    } else {
        collatz_aux(3*n+1, steps + 1)
    }
}

pub fn check_parity(n: u64) -> bool {
    if n % 2 == 0{
        true
    } else{
        false
    }
}

