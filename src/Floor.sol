// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface Floor {
    function isLastFloor(uint256 _floor) external returns (bool);
}

contract FloorImpl is Floor {
    uint256 public targetFloor;
    bool public lastFloorReached = false;

    constructor(uint256 _targetFloor) {
        targetFloor = _targetFloor;
    }

    function isLastFloor(uint256 _floor) external override returns (bool) {
        if (_floor == targetFloor) {
            lastFloorReached = true;
            return true;
        } else {
            return false;
        }
    }
}