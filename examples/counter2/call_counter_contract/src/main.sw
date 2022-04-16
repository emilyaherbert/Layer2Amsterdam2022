script;

use counter_library::{Counter, Basket};

const CONTRACT_ID: b256 = 0x5b8bc27e354f5b38c8ca65ec38a6ea9a1b9c3e94ae3e46f3181edd8cffc57efd;

fn main() -> u64 {
    let counter_contract = abi(Counter, CONTRACT_ID);
    counter_contract.initialize();
    counter_contract.increment(1, 2);
    counter_contract.increment(3, 99);
    counter_contract.decrement(200, 200);
    counter_contract.decrement(1, 1);
    let basket: Basket = counter_contract.get();
    basket.apples + basket.oranges // should be 103
}


