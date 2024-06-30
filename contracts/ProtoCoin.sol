// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ProtoCoin is ERC20 {

    address private _owner;
    uint256 private _mintAmount;
    uint64 private _mintDelay = 60 * 60 * 24;

    mapping(address => uint256) private nextMint;

    
    constructor() ERC20("ProtoCoin", "PRT") {
        _owner = msg.sender;
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to) public restricted {
        require(_mintAmount > 0, "Mint amount is not enable");
        require(block.timestamp >= nextMint[to], "Mint is not allowed yet");
        _mint(to, _mintAmount);

        nextMint[to] = uint64(block.timestamp + _mintDelay);
    }

    function setMintAmount(uint256 amount) public restricted {
        _mintAmount = amount;
    }

    function setMintDelay(uint64 delay) public restricted {
        _mintDelay = delay;
    }
    
    modifier restricted() {
        require(msg.sender == _owner, "Restricted to owner");
        _;
    }
}
