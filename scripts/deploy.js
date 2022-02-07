const hre = require("hardhat");

async function main() {
    const [deployer] = await hre.ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    console.log("Account balance:", (await deployer.getBalance()).toString());
  
    const SmartBankAccount = await hre.ethers.getContractFactory("SmartBankAccount");
    const smartBankAccount = await SmartBankAccount.deploy();
  
    console.log("Token address:", smartBankAccount.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });