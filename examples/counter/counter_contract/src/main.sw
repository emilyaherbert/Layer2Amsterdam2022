contract;

use std::storage::{get, store};
use counter_abi::Counter;

const SLOT = 0x0000000000000000000000000000000000000000000000000000000000000000;

impl Counter for Contract {
    fn initialize(initial_value: u64) -> u64 {
        store(SLOT, initial_value);
        get::<u64>(SLOT)
    }

    fn increment(increment_by: u64) -> u64 {
        let value = get::<u64>(SLOT) + increment_by;
        store(SLOT, value);
        get::<u64>(SLOT)
    }

    fn get() -> u64 {
        get::<u64>(SLOT)
    }

    /*
    fn decrement_counter(gas: u64, amount: u64, coin: b256, amount: u64) -> u64 {
        // check
        let stored_val: u64 = get(SLOT);
        if stored_val < amount {
            panic(stored_val);
        };

        // interaction
        let other_contract = abi(TestContract, 0x3dba0a4455b598b7655a7fb430883d96c9527ef275b49739e7b0ad12f8280eae);
        other_contract.decrement_counter(gas, amount, coin, amount);

        // effect -- this violates the CEI pattern
        let new_amount = stored_val - amount;
        store(SLOT, new_amount);
        new_amount
    }
    */
}


/*
contract;

abi TestContract {
    fn initialize_counter(value: u64) -> u64;
    fn increment_counter(amount: u64) -> u64;
}

storage {
    counter: u64
}

impl TestContract for Contract {
    fn initialize_counter(value: u64) -> u64 {
        storage.counter = value;
        value
    }

    fn increment_counter(amount: u64) -> u64 {
        let incremented = storage.counter + amount;
        storage.counter = incremented;
        incremented
    }
}
*/

