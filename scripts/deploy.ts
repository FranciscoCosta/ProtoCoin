import { ethers } from "hardhat";

async function main() {
    const protoCoin = await ethers.deployContract("ProtoCoin");

    await protoCoin.waitForDeployment();

    console.log("ProtoCoin deployed to:", protoCoin.target);

}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
