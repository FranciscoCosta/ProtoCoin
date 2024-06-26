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

    function mint() public {
        require(_mintAmount > 0, "Mint is not enabled");
        require(block.timestamp >= _mintDelay, "Mint is not available yet");
        _mint(msg.sender, _mintAmount);
        nextMint[msg.sender] = block.timestamp + _mintDelay;
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
