Here is the transformed README file in HTML format:

<h1>ProtoCoin (PRT)</h1> <h2>Introduction</h2> <p>ProtoCoin is an ERC-20 token implemented in Solidity using the OpenZeppelin library. It includes minting functionality that allows the owner to mint tokens to specified addresses with a configurable delay between mint operations.</p> <h2>Features</h2> <ul> <li><strong>ERC-20 Token</strong>: Implements the standard ERC-20 functionality using the OpenZeppelin library.</li> <li><strong>Initial Supply</strong>: The contract deployer is assigned an initial supply of 1,000,000 PRT tokens.</li> <li><strong>Minting</strong>: The contract owner can mint tokens to any address, with a configurable mint amount and delay between mint operations.</li> </ul> <h2>Installation</h2> <p>To use or modify this contract, follow these steps:</p> <ol> <li><code>git clone https://github.com/your-repo/protocoin.git</code></li> <li><code>cd protocoin</code></li> <li>Ensure you have Node.js and npm installed, then run: <code>npm install</code></li> </ol> <h2>Usage</h2> <p>To deploy and interact with the ProtoCoin contract:</p> <ol> <li><code>npx hardhat compile</code></li> <li>Create a deployment script (e.g., <code>scripts/deploy.js</code>) and deploy the contract:</li> </ol> <pre><code>javascript async function main() { const [deployer] = await ethers.getSigners(); const ProtoCoin = await ethers.getContractFactory("ProtoCoin"); const protoCoin = await ProtoCoin.deploy(); await protoCoin.deployed(); console.log("ProtoCoin deployed to:", protoCoin.address); } main() .then(() => process.exit(0)) .catch((error) => { console.error(error); process.exit(1); }); </code></pre> <ol start="3"> <li>Run the deployment script: <code>npx hardhat run scripts/deploy.js --network &lt;network-name&gt;</code></li> </ol> <h2>Interact with the Contract</h2> <p>Use a script or a frontend to interact with the deployed contract. Example of minting tokens:</p> <pre><code>javascript const protoCoin = await ethers.getContractAt("ProtoCoin", deployedAddress); await protoCoin.setMintAmount(100 * 10 ** 18); // Set mint amount await protoCoin.mint(recipientAddress); // Mint tokens </code></pre> <h2>Contract Details</h2> <h3>Constructor</h3> <pre><code>solidity constructor() ERC20("ProtoCoin", "PRT") { _owner = msg.sender; _mint(msg.sender, 1000000 * 10 ** decimals()); } </code></pre> <p>The constructor initializes the token with the name "ProtoCoin" and the symbol "PRT". It also assigns an initial supply of 1,000,000 tokens to the deployer.</p> <h3>Minting</h3> <pre><code>solidity function mint(address to) public restricted { require(_mintAmount > 0, "Mint amount is not enable"); require(block.timestamp >= nextMint[to], "Mint is not allowed yet"); _mint(to, _mintAmount); nextMint[to] = uint64(block.timestamp + _mintDelay); } </code></pre> <p>The mint function allows the owner to mint tokens to a specified address. The mint amount and delay between mint operations can be configured by the owner.</p> <h3>Owner-Only Functions</h3> <pre><code>solidity function setMintAmount(uint256 amount) public restricted { _mintAmount = amount; } function setMintDelay(uint64 delay) public restricted { _mintDelay = delay; } </code></pre> <p>These functions allow the owner to set the mint amount and delay between mint operations.</p> <h3>Restricted Modifier</h3> <pre><code>solidity modifier restricted() { require(msg.sender == _owner, "Restricted to owner"); _; } </code></pre> <p>This modifier restricts certain functions to be called only by the contract owner.</p> <h2>License</h2> <p>This project is licensed under the MIT License.</p>
<h2>References</h2>
<p>Frontend project: <a href="https://github.com/FranciscoCosta/Faucet-Protocoin">https://github.com/FranciscoCosta/Faucet-Protocoin</a></p>
<p>Backend project: <a href="https://github.com/FranciscoCosta/Backend-ProtoCoin">https://github.com/FranciscoCosta/Backend-ProtoCoin</a></p>
