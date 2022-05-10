library counter_library;

pub struct Basket {
    apples: u64,
    oranges: u64,
}

abi Counter {
    fn initialize();
    fn increment(n_apples: u64, n_oranges: u64);
    fn get() -> Basket;
}


