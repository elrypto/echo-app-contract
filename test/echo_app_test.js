const EchoApp = artifacts.require("./EchoApp.sol");


const testIndexName = "best windex";


contract("EchoApp", accounts => {
  it("...simple create index and return", async () => {
    const echoInstance = await EchoApp.deployed();
    const tx  = await echoInstance.createIndex(testIndexName, accounts[1], {from: accounts[0]});
    let retval = await echoInstance.getIndexName(accounts[1]);

    assert.equal (tx.logs[0].args._name, testIndexName, "not blockchain tx value expected for test index created");
    assert.equal(retval, testIndexName, "created index name should match")
  });
});






