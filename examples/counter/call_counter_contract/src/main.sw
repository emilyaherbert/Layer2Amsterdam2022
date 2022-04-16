script;

use counter_library::{Counter, Basket};

const CONTRACT_ID: b256 = 0xf0ae61242b157cc4f0f2168bcd7203eb0e936f505ca51f7bd9d407091c6c9444;

fn main() -> u64 {
    let counter_contract = abi(Counter, CONTRACT_ID);
    counter_contract.initialize();
    counter_contract.increment(1, 2);
    counter_contract.increment(3, 99);
    let basket: Basket = counter_contract.get();
    basket.apples + basket.oranges // should be 105
}


