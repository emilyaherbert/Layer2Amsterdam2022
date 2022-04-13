library counter_abi;

abi Counter {
    fn initialize(initial_value: u64) -> u64;
    fn increment(increment_by: u64) -> u64;
    fn get() -> u64;
}