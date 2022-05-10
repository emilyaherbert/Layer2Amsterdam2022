use fuel_tx::Salt;
use fuels_abigen_macro::abigen;
use fuels_contract::{contract::Contract, parameters::TxParameters};
use fuels_signers::util::test_helpers;

// Load abi from json
abigen!(Counter, "out/debug/counter_contract-abi.json");

async fn get_instance() -> Counter {

    // Build the contract
    let salt = Salt::from([0u8; 32]);
    let compiled = Contract::load_sway_contract("./out/debug/counter_contract.bin", salt).unwrap();

    // Launch a local network and deploy the contract
    let (provider, wallet) = test_helpers::setup_test_provider_and_wallet().await;
    let id = Contract::deploy(&compiled, &provider, &wallet, TxParameters::default())
        .await
        .unwrap();
    Counter::new(id.to_string(), provider, wallet)
}

#[tokio::test]
async fn increment_and_get() {
    // 1. build the contract
    // 2. launch a local Fuel network
    // 3. deploy the contract
    // 4. create a handle to the deployed contract ↓↓↓↓
    let instance = get_instance().await;

    instance
        .initialize()
        .call()
        .await
        .unwrap();

    instance
        .increment(1, 2)
        .call()
        .await
        .unwrap();

    instance
        .increment(3, 99)
        .call()
        .await
        .unwrap();

    let result = instance
        .get()
        .call()
        .await
        .unwrap();

    assert_eq!(result.value.apples + result.value.oranges, 105);
}