const EchoApp = artifacts.require("./EchoApp.sol");

const testIndexName = "best windex";


contract("EchoApp", accounts => {

  const SUBMITTING_ACCT = accounts[0];
  const INDEX_OWNER = accounts[1];
  const FOLLOWER_ONE = accounts[2];
  const FOLLOWER_TWO = accounts[3];
  

  it("...should create a single index and then get the name", async () => {
    const echoInstance = await EchoApp.deployed();
    const tx  = await echoInstance.createIndex(testIndexName, INDEX_OWNER, {from: SUBMITTING_ACCT});
    let retval = await echoInstance.getIndexName(INDEX_OWNER);

    assert.equal (tx.logs[0].args._name, testIndexName, "not blockchain tx value expected for test index created");
    assert.equal(retval, testIndexName, "created index name should match")
  });


  it("...should follow the index that was created", async () => {
    const echoInstance = await EchoApp.deployed();

    let count = await echoInstance.followCount(INDEX_OWNER);
    assert.equal(0, count, 'should be no followers at this stage');

    await echoInstance.follow(INDEX_OWNER, FOLLOWER_ONE);
    count = await echoInstance.followCount(INDEX_OWNER);
    assert.equal(1, count, 'should be 1 follower, that we just created, at this stage');
  });


  it("...add another follower and get both back", async () => {
    const echoInstance = await EchoApp.deployed();

    let count = await echoInstance.followCount(INDEX_OWNER);
    assert.equal(1, count, 'should be 1 followers at this stage');

    await echoInstance.follow(INDEX_OWNER, FOLLOWER_TWO);
    count = await echoInstance.followCount(INDEX_OWNER);
    assert.equal(2, count, 'should be 2 follower, that we just created, at this stage');

    let totalFollowers = await echoInstance.getTotalFollowers();
    console.log("totalFollowers;", totalFollowers);

    let allFollowers = await echoInstance.getAllFollowers();
    console.log("allFollowers", allFollowers);

    let followerIds = await echoInstance.allFollowersOfAnIndex(INDEX_OWNER);
    for (let i in followerIds){
      console.log(i, followerIds[i]); 
      //assert.equal(followerIds[i], 0, "expect first item to have id of 0");
      //assert.equal(followerIds[i], 1, "expect second item to have id of 1");
    }

  });


});






