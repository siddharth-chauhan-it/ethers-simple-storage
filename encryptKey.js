// Run this script once to generate .encryptedKey.json file

const ethers = require("ethers");
const fs = require("fs");
require("dotenv").config();

async function main() {
  const wallet = new ethers.Wallet(process.env.GANACHE_ACCOUNT_PRIVATE_KEY);
  const encryptedJsonKey = await wallet.encrypt(process.env.ENCRYPTED_KEY_PASSWORD);
  console.log("encryptedJsonKey:");
  console.log(encryptedJsonKey);
  fs.writeFileSync("./.encryptedKey.json", encryptedJsonKey);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
