import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import hre from "hardhat";

describe("ProtoCoin", function () {
  
  async function deployFixture() {

    const [owner, otherAccount] = await hre.ethers.getSigners();

    const ProtoCoin = await hre.ethers.getContractFactory("ProtoCoin");
    const protoCoin = await ProtoCoin.deploy();

    return { protoCoin, owner, otherAccount };
  }

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      const { owner } = await deployFixture();
      expect(await owner.getAddress()).to.equal(await owner.getAddress());
    });

    it("Should set the right name", async function () {
      const { protoCoin } = await deployFixture();
      expect(await protoCoin.name()).to.equal("ProtoCoin");

    });

    it("Should set the right symbol", async function () {
      const { protoCoin } = await deployFixture();
      expect(await protoCoin.symbol()).to.equal("PROTO");

    });

    it("Should set the right decimals", async function () {
      const { protoCoin } = await deployFixture();
      expect(await protoCoin.decimals()).to.equal(18);

    });

    it("Should set the right total supply", async function () {
      const { protoCoin } = await deployFixture();
      expect(await protoCoin.totalSupply()).to.equal(1000000);

    });

    it("Should mint the total supply to the owner", async function () {
      const { protoCoin, owner } = await deployFixture();
      expect(await protoCoin.balanceOf(await owner.getAddress())).to.equal(1000000);

    });

    });
});
