#!/bin/bash

cd counter_abi;
forc build;
cd ../counter_contract;
forc build;
cd ../call_counter;
forc build;