// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

contract strMemoCall {
    /*
    1. Storage ->
        1.1 store state variables
        1.2 It is stored directly in the blockchain
        1.3 it costs gas

    2. Memory ->
        2.1 store local variables
        2.2 It can be in function
        2.3 stored in RAM
        2.4 naglagable amount of gas cost

    3. CallData ->
        3.1 uses in function Input
        3.2 we can use calldata inside the memory
        3.3 if we will take input in calldata we can't change it
        3.4 low cost of gas
    */

    uint256[] public a = [1,2,3,4,5];
    function Str() public {
        uint256[] storage a1 = a; // a1 is pointing on a = [1,2,3,4,5] values
        a1[2] = 300;
    }

    function memo() public view {
        uint256[] memory a1 =  a;  // a1 is just storing a values into RAM means it's just viewing on a that's why I need to make it as a view fn
        a1[1] = 200;
    }

    function Memo(string memory s, uint256[] memory a) public {
        memo1(a);
        // Call1(a);  // when we pass memory data into a calldata it will show error
    }

    function Call(string calldata s, uint256[] calldata a) public {
        memo1(a);  // It will create a new array into memory, it is possible calldata-> memory but memory -> calldata(not possible)
        Call1(a); // when we pass calldata -> calldata it waill not create any new data (Low gas)
    }

    function memo1(uint256[] memory a) public {

    }

    function Call1(uint256[] calldata a) public {

    }





}
