const Echo = artifacts.require("./EchoTest.sol");


const testval = "best windex";


contract("Echo", accounts => {
  it("...simple value set should set and and return ", async () => {
    const echoInstance = await Echo.deployed();
    await echoInstance.setTestVal(testval, {from: accounts[0]});
    
    /*
    const tx = await simpleStore.set(newValue, {from: accounts[0]})
    assert.equal(tx.logs[0].args._value.toNumber(), newValue)
    */

    let retval = await echoInstance.getTestVal();
    console.log(retval);
  });
});



