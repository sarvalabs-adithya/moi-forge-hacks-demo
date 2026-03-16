# MOI Forge Hacks Demo

Demo code for MOI Forge Hacks. Shows the difference between contract-centric (Ethereum/ERC20) and participant-centric (MOI/Cocolang) state.

## Repo structure

```
erc20-show-only/
  ERC20.sol            — Annotated ERC20 (show-only, not deployed)

moi-dapp/
  logic/
    asset.coco         — MAS0-style token in Cocolang
    coco.nut           — Coco project config
    assetlogic.json    — Compiled manifest (from coco compile)
  scripts/
    deploy.js          — js-moi-sdk deploy script
  .env                 — ADMIN_MNEMONIC (not committed)
  package.json         — Dependencies
```

## Quick start

```bash
cd moi-dapp
npm install
# Set ADMIN_MNEMONIC in .env, then:
node scripts/deploy.js
```

## Key idea

- **Ethereum**: `mapping(address => uint256)` inside a contract. The contract is the bank.
- **MOI**: `state actor: balance U64` — each participant holds their own balance. YOU are the bank.
