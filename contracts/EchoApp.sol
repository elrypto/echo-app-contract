pragma solidity ^0.4.22;



contract EchoApp {

  mapping (address => address) schainAddrToEthAddr;
  mapping (address => string) ownerToIndexName;
  mapping (address => address) indexToFollowers;

  event indexCreated(string _name, address _address);


  function createIndex(string memory _name, address _addrOnEthNetwork) public {
    ownerToIndexName[msg.sender] = _name;
    schainAddrToEthAddr[msg.sender] = _addrOnEthNetwork;
    emit indexCreated(_name, msg.sender);
  }

  function getIndexName() public view returns (string memory) {
    return ownerToIndexName[msg.sender];
  }

  function getEthAddress(address _addr) public view returns (address){
    return schainAddrToEthAddr[_addr];
  }


}
 

  
