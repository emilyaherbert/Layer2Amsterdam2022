script;

use std::assert::assert;
use counter_abi::Counter;

fn main() -> bool {
    let abi = abi(Counter, 0x9b088bd959c77f21cfef2af3bb5695092e29f71acabd76cc7a8ede164d653843);
    abi.initialize(0); // comment this line out to just increment without initializing
    abi.increment(5);
    abi.increment(5);
    let result = abi.get();
    assert(result == 10);
    log(result);

    true
}

fn log(input: u64) {
    asm(r1: input, r2: 42) {
        log r1 r2 r2 r2;
    }
}
