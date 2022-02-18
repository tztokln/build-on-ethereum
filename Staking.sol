// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

contract Storage {
    uint totalContractBalance = 0;

    mapping(address => uint) public balance;

    uint constant public threshold = 0.003 * 10**18;

    uint public deadline = block.timestamp + 1 minutes;


    function isActive() public view returns(bool) {
        //  We check whether the current time is within the deadline and the balance of the contract is more than the threshold amount.
        //   If both these conditions are fulfilled, then our contract will be active.
        return block.timestamp <= deadline && totalContractBalance >= threshold;
    }

    function getContractBalance() public view returns(uint){
        return totalContractBalance;
    }

    function deposit() public payable {  

        balance[msg.sender] += msg.value;
        totalContractBalance += msg.value;
    }

    // built in function, triggered when the contract receives money 
    receive() external payable { deposit(); }

    function withdraw() public {
        // check if user has this money on the balance
        require(block.timestamp > deadline, " not yet");
        require(!isActive(), "Contract is active");
        require(balance[msg.sender] > 0 , " no deposite ");
        uint amount = balance[msg.sender];

        balance[msg.sender] = 0;

        totalContractBalance -= amount;
    }
}