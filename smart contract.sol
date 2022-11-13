pragma solidity ^0.4.19;

contract Bank {

    mapping(address => uint256) public balanceOf;   // balances, indexed by addresses

    function deposit() public payable  {
        
        balanceOf[msg.sender] +=msg.value;     // adjust the account's balance
        
    }

    function withdraw(uint256 amount) public payable returns(bool){
        require(amount <= balanceOf[msg.sender], 'no funds');
        balanceOf[msg.sender] -= amount;
        (msg.sender).transfer(amount);
        return true;
    }
    function showb() public view returns(uint256) {
        return balanceOf[msg.sender];
    }
}