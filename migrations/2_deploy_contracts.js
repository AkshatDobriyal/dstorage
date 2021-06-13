const DStorage = artifacts.require("./DStorage.sol");

module.exports = function(deployer) {
	deployer.deploy(DStorage);
};
