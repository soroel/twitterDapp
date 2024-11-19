require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({path: ".env"});
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  
  networks: {
    sepolia: {
      url:"https://eth-sepolia.g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY_SEPOLIA}",
      accounts: [process.env.private_key_alchemy],
    },
    ethereum: {
      url: "https://eth-mainnet.g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY_MAIN}",
      accounts: [process.env.private_key_wallet],
      chainId: 1,
    
    },
  },
  solidity: "^0.8.27",
};
