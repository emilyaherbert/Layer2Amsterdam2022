contract;

use counter_library::{Counter, Basket};

storage {
    basket: Basket
}

impl Counter for Contract {
    //#[storage(write)]
    fn initialize() {
        storage.basket = Basket {
            apples: 0,
            oranges: 0
        };
    }

    //#[storage(read, write)]
    fn increment(n_apples: u64, n_oranges: u64) {
        storage.basket.apples = storage.basket.apples + n_apples;
        storage.basket.oranges = storage.basket.oranges + n_oranges;
    }

    //#[storage(read)]
    fn get() -> Basket {
        storage.basket
    }
}



