const hre = require("hardhat");

async function main() {
    // Get the ContractFactory
    const Twitter = await hre.ethers.getContractFactory("Twitter");

    // Deploy the contract
    const twitter = await Twitter.deploy();

    // Wait for deployment to finish
    await twitter.deployed();

    console.log("Twitter contract deployed to:", twitter.address);
}

// Execute the deployment script
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});

