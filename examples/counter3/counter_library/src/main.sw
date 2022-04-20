library counter_library;

pub struct Basket<T> where T: Add {
    apples: T, // u8
    oranges: T, // u32
}

impl<T> Basket<T> where T: Add {
    fn sum(self) -> u64 {
        self.apples + self.oranges
    }
}

abi Counter {
    fn initialize();
    fn increment(n_apples: T, n_oranges: T);
    fn get() -> Basket;
}
