import dotenv from "dotenv";
import { dirname, join } from "path";
import { fileURLToPath } from "url";

const __dirname = dirname(fileURLToPath(import.meta.url));
dotenv.config({ path: join(__dirname, "..", ".env") });

import { Wallet, JsonRpcProvider, LogicFactory } from "js-moi-sdk";
import manifest from "../logic/assetlogic.json" with { type: "json" };

const MNEMONIC = process.env.ADMIN_MNEMONIC;
const RPC_URL =
  process.env.MOI_RPC_URL ||
  "https://dev.voyage-rpc.moi.technology/devnet";

const TOKEN_NAME = process.env.TOKEN_NAME || "MoiToken";
const TOKEN_SYMBOL = process.env.TOKEN_SYMBOL || "MOT";

async function main() {
  if (!MNEMONIC) {
    console.error("Error: ADMIN_MNEMONIC environment variable is required.");
    console.error(
      'Usage: ADMIN_MNEMONIC="your twelve word mnemonic" ' +
        'TOKEN_NAME="MyToken" TOKEN_SYMBOL="MTK" node scripts/deploy.js'
    );
    process.exit(1);
  }

  const provider = new JsonRpcProvider(RPC_URL);
  const wallet = await Wallet.fromMnemonic(
    MNEMONIC,
    "m/44'/6174'/7020'/0/0"
  );
  wallet.connect(provider);

  const deployer = (await wallet.getIdentifier()).toString();
  console.log(`Deploying AssetLogic...`);
  console.log(`  Deployer : ${deployer}`);
  console.log(`  Name     : ${TOKEN_NAME}`);
  console.log(`  Symbol   : ${TOKEN_SYMBOL}`);

  const factory = new LogicFactory(manifest, wallet);
  const deployIx = await factory.deploy("Init", TOKEN_NAME, TOKEN_SYMBOL);
  const result = await deployIx.result();

  console.log("\nDeployed successfully!");
  console.log(`\nASSET_LOGIC_ID=${result.logic_id}`);
  console.log("\nAdd this to your .env.local or use it in your frontend.");
}

main().catch(console.error);
