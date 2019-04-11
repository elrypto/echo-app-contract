pragma solidity ^0.4.23;
// pragma solidity ^0.5.0;


contract EchoApp {

  mapping (address => string) ethAddrToIndexName;
  mapping (uint => address) followerToIndex;
  mapping (address => uint) indexToFollowersCount;
  uint totalFollowersCount;

  address[] followers;


  event indexCreated(string _name, address _ethAddress, address _sChainAddress);
  event indexFollowed(address _followed, address _follower);
  event indexUnFollowed(address _unFollowed, address _follower);


//modifier onlyOne
  modifier mustExist(address _addr){
    bytes memory emptyStringTest = bytes(ethAddrToIndexName[_addr]);
    require(emptyStringTest.length != 0, " Index must exist, call createIndex() to initialize first.");
    _;
  }

  function createIndex(string memory _name, address _addrOnEthNetwork) public {
    ethAddrToIndexName[_addrOnEthNetwork] = _name;
    emit indexCreated(_name, _addrOnEthNetwork, msg.sender);
  }

  function getIndexName(address _ethAddr) public view returns (string memory) {
    return ethAddrToIndexName[_ethAddr];
  }

  function followCount(address _ethAddr) public view returns (uint){
    return indexToFollowersCount[_ethAddr];
  }

  //function unfollow()

  //TODO: call modifier mustExist()
  function follow(address _toFollowEthAddr, address _followerEthAddr) public {
    uint id = followers.push(_followerEthAddr) - 1;
    followerToIndex[id] = _followerEthAddr;
    indexToFollowersCount[_toFollowEthAddr]++;
    totalFollowersCount++;
    emit indexFollowed(_toFollowEthAddr, _followerEthAddr);
  } 


  function allFollowersOfAnIndex(address _followedEthAddr) public view returns (uint[] memory){
    uint[] memory result = new uint[](indexToFollowersCount[_followedEthAddr]);
    uint counter = 0;
    for (uint i = 0; i < followers.length; i++){
       if(followerToIndex[i]==_followedEthAddr){
            result[counter] = i;
            counter++;
        }
    }
    return result;
  }
  
  function getTotalFollowers() public view returns(uint){
    return totalFollowersCount;
  }


  function getAllFollowers() public view returns (address[]){
    address[] memory ids = new address[](totalFollowersCount);

    for (uint i=0; i < totalFollowersCount; i++){
      ids[i] = followers[i];
    }
    
    return ids;
  }

}
 

  
