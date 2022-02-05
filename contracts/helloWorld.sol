pragma solidity ^0.8.3;

contract HelloWorld {
    uint public num;
    string public greeting = "Hello world";

    function getNum() public view returns(uint)  {
        return num;
    }
    function set(uint _num) public {
        num = _num;
    }
}