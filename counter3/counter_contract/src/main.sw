contract;

use counter_library::{Counter, Basket};
use std::result::Result;

storage {
    basket: Basket
}

fn enough_in_basket(n_apples: u64, n_oranges: u64) -> Result<Basket, ()> {
    if storage.basket.apples >= n_apples && storage.basket.oranges >= n_oranges {
        Result::Ok(Basket {
            apples: storage.basket.apples - n_apples,
            oranges: storage.basket.oranges - n_oranges,
        })
    } else {
        Result::Err(())
    }
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

    //#[storage(read, write)]
    fn decrement(n_apples: u64, n_oranges: u64) {
        if let Result::Ok(new_basket) = enough_in_basket(n_apples, n_oranges) {
            storage.basket = new_basket;
        }
    }

    //#[storage(read)]
    fn get() -> Basket {
        storage.basket
    }
}



