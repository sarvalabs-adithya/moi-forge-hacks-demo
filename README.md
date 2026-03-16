# MOI Hacks

Build the Future of Participant-Centric Blockchain.

**Kickoff:** March 17, 2026 | **Submissions Due:** March 31, 2026

---

## What is MOI?

MOI is a Layer 1 blockchain with a participant-centric architecture. On Ethereum, the contract is the bank — your balance lives inside a contract's storage as a row in a mapping. You don't hold your tokens; the contract says you hold them. On MOI, **you are the bank**. Your state (balances, data, reputation) lives with you as a participant. When you interact with a logic, your state updates in your own participant context.

This is participant-centric state — and it changes everything about how you build decentralized applications.

---

## The Hackathon

Pick a track. Build on MOI. Ship by March 31.

No prior blockchain experience required. We'll give you all the resources you need.

### Tracks

**Track 1 — DEX (Decentralized Exchange)**
Build a token swap on MOI using participant-centric state. AMM, order book, or your own design — leverage participant identity to make trading smarter than just "send tokens, get tokens."

**Track 2 — DAO (Decentralized Governance)**
Build a governance system on MOI where voting power comes from participation, not just token holdings. Proposals, voting, execution — all participant-centric.

**Track 3 — Bridge (Cross-Chain)**
Build a bridge between MOI and another chain. Design a mechanism where participant-centric state makes cross-chain transfers safer and more trustworthy.

---

## Timeline

| When | What |
|------|------|
| **March 17** | Kickoff presentation + live demo. Join the Discord. |
| **March 17–31** | Build phase. Discord office hours available ad hoc. |
| **March 31** | Submissions due by 11:59 PM. |

---

## Submission

Submit your project by filling out this form: **[Submission Form — TBD]()**

Your submission must include:

- **Public GitHub repo** with all source code (must include Cocolang logic files)
- **README** covering: problem statement, approach, how participant-centric state is used, setup & run instructions, team member names
- **2-minute demo video** — screen recording is fine (upload to YouTube or Loom)

---

## Judging Criteria

| Criterion | Weight | What We're Looking For |
|-----------|--------|----------------------|
| Use of Participant-Centric State | 40% | Is it meaningfully different from what you'd build on Ethereum? |
| Functionality | 25% | Does it work? Even a partial working prototype beats a perfect slide deck. |
| Creativity | 20% | Surprising or clever approaches. Did you find a use case we didn't think of? |
| Presentation | 15% | Clear explanation. Can a non-technical person understand why this matters? |

---

## Materials

- [Kickoff Slide Deck (PPTX)](./docs/MOI_Hacks_Deck.pptx)
- [Hackathon Playbook (DOCX)](./docs/MOI_Hacks_Playbook.docx)

---

## ERC20 vs MAS0 — The Core Difference

This is the heart of understanding why MOI is different:

|  | Ethereum (ERC20) | MOI (MAS0) |
|--|-------------------|------------|
| Where state lives | Inside the contract (a mapping) | With the participant (persistent state) |
| Action model | Transaction (fire & forget) | Interaction (contextual, identity-aware) |
| Identity | `msg.sender` (just an address) | Full participant context |
| Transfer semantics | Ledger edit — two numbers change | True ownership transfer between participants |
| Analogy | Bank updates its spreadsheet | You hand cash to someone directly |

---

## Resources

| Resource | Link |
|----------|------|
| MOI Docs | [docs.moi.technology](https://docs.moi.technology) |
| Cocolang Docs | [cocolang.dev](https://cocolang.dev) |
| js-moi-sdk Docs | [js-moi-sdk.docs.moi.technology](https://js-moi-sdk.docs.moi.technology) |
| Voyage Explorer & Faucet | [voyage.moi.technology](https://voyage.moi.technology) |
| GitHub — Sarvalabs | [github.com/sarvalabs](https://github.com/sarvalabs) |

---

## Discord

All coordination, team formation, office hours, and Q&A happen on Discord.

**[Join the Discord — TBD]()**
