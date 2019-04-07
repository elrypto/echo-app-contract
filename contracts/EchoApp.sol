pragma solidity ^0.4.22;



contract EchoApp {

  string testVal;

  function setTestVal(string _s) public {
    testVal = _s;
  }

  function getTestVal() public view returns (string){
    return testVal;
  }

}
  //mapping (address => string) ownerToIndexName;
  //mapping (uint => address) public tokenToOwner;
  //mapping (address => uint) ownerTokenCount;
/*
  Token[] public tokens;

  event indexCreated(string _name, address _address);
  event tokenAdded(uint _id, string _symbol, uint _amount);

  struct Token{
    string symbol;
    uint amount; 
  }

  modifier indexMustExist(){
    bytes memory emptyStringTest = bytes(ownerToIndexName[msg.sender]);
    require(emptyStringTest.length != 0, " Index must exist, call createIndex() and initialize first.");
    _;
  }

 

  function addToken(string memory _symbol, uint _amount) public indexMustExist{
    uint id = tokens.push(Token(_symbol, _amount)) - 1;
    tokenToOwner[id] = msg.sender;
    ownerTokenCount[msg.sender]++;    
    emit tokenAdded(id, _symbol, _amount);

  }

  function tokenCount() public view returns (uint){
    return ownerTokenCount[msg.sender];
  }

  function getToken(uint _id) public view returns(string memory, uint){
    return (tokens[_id].symbol, tokens[_id].amount);
  }

  
  
  function tokensForOwner(address _owner) public view returns (uint[] memory){
    uint[] memory result = new uint[](ownerTokenCount[_owner]);
    uint counter = 0;
    for (uint i = 0; i < tokens.length; i++){
        if(tokenToOwner[i]==_owner){
            result[counter] = i;
            counter++;
        }
    }
    return result;
  }
  

  function createIndex(string memory _name) public {
    ownerToIndexName[msg.sender] = _name;
    emit indexCreated(_name, msg.sender);
  }

  function getIndexName() public view returns (string memory) {
    return ownerToIndexName[msg.sender];
  }
}*/
