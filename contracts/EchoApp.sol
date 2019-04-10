pragma solidity ^0.4.22;



contract EchoApp {

  mapping (address => string) ethAddrToIndexName;
  mapping (address => address) indexToFollowers;

  event indexCreated(string _name, address _ethAddress, address _sChainAddress);


  function createIndex(string memory _name, address _addrOnEthNetwork) public {
    ethAddrToIndexName[_addrOnEthNetwork] = _name;
    emit indexCreated(_name, _addrOnEthNetwork, msg.sender);
  }

  function getIndexName(address _ethAddr) public view returns (string memory) {
    return ethAddrToIndexName[_ethAddr];
  }

}
 

  
