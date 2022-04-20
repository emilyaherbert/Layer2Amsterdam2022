use fuel_tx::Salt;
use fuels_abigen_macro::abigen;
use fuels_contract::{contract::Contract, parameters::TxParameters};
use fuels_signers::util::test_helpers;

// Load abi from json
abigen!(CounterContract, "out/debug/abi.json");

#[tokio::test]
async fn increment_and_get() {
    // Build the contract
    let salt = Salt::from([0u8; 32]);
    let compiled = Contract::load_sway_contract("./out/debug/bin.bin", salt).unwrap();

    // Launch a local network and deploy the contract
    let (provider, wallet) = test_helpers::setup_test_provider_and_wallet().await;
    let id = Contract::deploy(&compiled, &provider, &wallet, TxParameters::default())
        .await
        .unwrap();

    // retrieve the contract instance
    let counter_contract = CounterContract::new(id.to_string(), provider, wallet)

    counter_contract.initialize().call().await.unwrap();
    counter_contract.increment(99).call().await.unwrap();
    counter_contract.increment(1).call().await.unwrap();
    let apples = counter_contract.get().call().await.unwrap();

    assert_eq!(apples.value, 100);
}




