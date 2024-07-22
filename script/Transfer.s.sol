// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "../src/HackMeIfYouCan.sol";

contract TransferScript is Script {
    HackMeIfYouCan public hackMeIfYouCan;

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        hackMeIfYouCan = HackMeIfYouCan(payable(0x9D29D33d4329640e96cC259E141838EB3EB2f1d9));

        uint256 balance = hackMeIfYouCan.balanceOf(tx.origin);
        console.log("Current balance:", balance);

        hackMeIfYouCan.transfer(address(0), 1);

        console.log("Marks after transfer:", hackMeIfYouCan.getMarks(tx.origin));
        vm.stopBroadcast();
    }
}