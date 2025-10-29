# BequestBlock1
A simple Solidity smart contract for recording inheritance details.
<img width="1915" height="1077" alt="Screenshot 2025-10-29 140014" src="https://github.com/user-attachments/assets/994ad1e3-3ffd-417c-af9a-e1204396f37f" />
# 🧱 BequestBlock

BequestBlock is a simple and transparent **inheritance recording smart contract** built using **Solidity**.  
It allows individuals to **immortally store inheritance details** on the blockchain — ensuring that records of who inherits what remain **immutable, public, and tamper-proof**.

---

## 🪙 Project Description

In traditional systems, inheritance documentation can be lost, forged, or disputed.  
**BequestBlock** solves this by leveraging blockchain technology to create a **trustless and permanent record** of inheritance wishes.  
Every entry is securely stored on-chain and cannot be modified once recorded.

---

## 💡 What It Does

- Lets a user (the *owner*) record an inheritance for a chosen *beneficiary*.
- Stores details such as:
  - Owner’s address  
  - Beneficiary’s address  
  - Description of the asset (property, funds, NFT, etc.)  
  - Timestamp of record creation  
- Keeps all data **publicly verifiable and immutable** on the blockchain.

---

## ✨ Features

✅ **Immutable Records** – Once stored, inheritance details can’t be altered or deleted.  
✅ **Transparent Access** – Anyone can view the records via blockchain explorers.  
✅ **Beginner-Friendly** – Simple Solidity code and functions for easy understanding.  
✅ **Trustless System** – No third-party or central authority required.  
✅ **Upgradeable Idea** – Can later include time locks, fund transfers, or executors.

---

## 🚀 Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title BequestBlock - Immutable Inheritance Record System
/// @author You
/// @notice This contract lets users record inheritance details permanently on-chain.

contract BequestBlock {

    // Struct to store inheritance details
    struct Bequest {
        address owner;          // The person creating the bequest
        address beneficiary;    // Who will inherit
        string assetDetails;    // Description of the asset (e.g., "Property in Delhi", "10 ETH")
        uint256 timestamp;      // When the bequest was recorded
    }

    // A list of all bequests recorded
    Bequest[] public bequests;

    // Mapping from owner address to their bequest count
    mapping(address => uint256) public bequestCount;

    /// @notice Record a new inheritance on-chain
    /// @param _beneficiary Address of the inheritor
    /// @param _assetDetails Description of the asset being inherited
    function recordBequest(address _beneficiary, string memory _assetDetails) public {
        require(_beneficiary != address(0), "Invalid beneficiary address");

        Bequest memory newBequest = Bequest({
            owner: msg.sender,
            beneficiary: _beneficiary,
            assetDetails: _assetDetails,
            timestamp: block.timestamp
        });

        bequests.push(newBequest);
        bequestCount[msg.sender]++;
    }

    /// @notice Get total number of bequests recorded
    function totalBequests() public view returns (uint256) {
        return bequests.length;
    }

    /// @notice Get details of a specific bequest by index
    function getBequest(uint256 index)
        public
        view
        returns (address, address, string memory, uint256)
    {
        require(index < bequests.length, "Invalid index");
        Bequest memory b = bequests[index];
        return (b.owner, b.beneficiary, b.assetDetails, b.timestamp);
    }
}
