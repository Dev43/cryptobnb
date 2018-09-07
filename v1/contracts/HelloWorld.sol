//jshint ignore: start

pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract HelloWorld is Ownable {

  string contractName = "default";
  uint8 nameChanges = 0;
  //log string
  event Hello(string _msg);
  //trivial hello function, only owner can call
  function hello(string _msg) external onlyOwner {
    emit Hello(_msg); //note emit keyword
  }

  /* Non essential functions below. These functions are there for educational purposes */


  // Function changes the name of the contract, can only be called by the owner
  function changeName(string _newName) public onlyOwner {
    contractName = _newName;
    increaseNameChange();
  }

  // This function reads from state and doesnt change it
  function getName() public view returns(string) {
    return contractName;
  }

  // This function is only callable by a function in this contract
  function increaseNameChange() private {
    nameChanges++;
  }

}
