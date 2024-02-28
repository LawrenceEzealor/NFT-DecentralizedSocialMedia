import { ethers } from "hardhat";

async function main() {
  

  const socialMedia = await ethers.deployContract("SocialMedia");

  await socialMedia.waitForDeployment();

  //  const nft = await ethers.deployContract("NFT", ["LAWRENCE", "LAW"]);

  // await nft.waitForDeployment();

  console.log(
    `SocialMedia with deployed to ${socialMedia.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
