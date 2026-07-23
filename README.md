# Crowd Funding Platform

This workspace contains the early source for a crowd funding platform with a Solidity smart contract at the root of the blockchain layer.

## Project Structure

- `thirdweb-contract/CF.sol` - the main Solidity contract file.
- `thirdweb-contract/contracts/` - placeholder folder for additional contract files.
- `client/` - placeholder folder for the frontend application.
- `package.json` - minimal root package manifest with `dotenv` as the only dependency for now.

## Current State

The project is still at an early setup stage.

- No root scripts are defined yet.
- The main code entry point currently appears to be `thirdweb-contract/CF.sol`.
- The frontend folder is present but has not been populated yet.

## Getting Started

1. Install dependencies from the project root:

   ```bash
   npm install
   ```

2. Open `thirdweb-contract/CF.sol` to continue smart contract development.

3. Add frontend files under `client/` when you are ready to build the UI.

## Notes

- Add root scripts to `package.json` when build, test, or deploy commands are defined.
- If you introduce environment variables, keep them in a local `.env` file and load them with `dotenv`.
