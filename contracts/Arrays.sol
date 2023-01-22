// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Array - dynamic or fixed size
// Initialization
// Insert(push) ,get ,update ,delete ,pop ,length
// Creating array in memory
// Returning array from function

contract Arrays {
    uint256[] public nums = [1, 2, 3];
    uint256[3] public numsFixed = [1, 2];
    uint256 public len;

    function add() public {
        nums.push(4);
        numsFixed[2] = 3;
        //delete nums[2]; // [1,2,0]
        nums.pop();
        len = nums.length;

        // create array in memory
        //uint256[] memory a = new uint256[](5);
        // the array in the memory should be fixed and we can't use push or pop in these arrays
    }

    uint256[] public array = [1, 2, 3, 4, 5];
    bool elemFind;

    function remove_1() public returns (uint256[] memory) {
        uint256[] memory temp = new uint256[](array.length - 1);
        for (uint256 i = 0; i < array.length; i++) {
            if (array[i] == 3) {
                elemFind = true;
                continue;
            } else {
                if (elemFind) {
                    temp[i - 1] = array[i];
                } else {
                    temp[i] = array[i];
                }
            }
        }
        return temp;
    }

    function remove_2(uint256 _index) public {
        for (uint256 i = _index; i < array.length - 1; i++) {
            array[i] = array[i + 1];
        }
        array.pop();
    }

    function remove_3(uint256 _index) public {
        array[_index] = array[array.length - 1];
        array.pop();
    }

    function test() external {
        //[1, 2, 3, 4, 5, 6, 7, 8];
        remove_2(2);
        assert(array[0] == 1);
        assert(array[1] == 2);
        assert(array[2] == 4);
        assert(array[3] == 5);
        assert(array.length == 4);
    }
}
