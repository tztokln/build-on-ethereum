require("@nomiclabs/hardhat-waffle");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */

const LOCAL_URL = "http://127.0.0.1:8545/";
// https://mainnet.infura.io/v3/ff8dc4ce071247a8a4635aa090cf4934

const PRIVATE_KEY = '4a49a96d6fb949278cb6fc208e3fa789';


module.exports = {
  solidity: "0.7.3",
  networks: {
    local: {
      url: LOCAL_URL,
      accounts: [PRIVATE_KEY]
    }
  }
};
