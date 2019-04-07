var Echo = artifacts.require("./EchoApp.sol");

module.exports = function(deployer, network) {
  if (network === 'rinkeby') {
    return
  }

  deployer.deploy(Echo);
};
