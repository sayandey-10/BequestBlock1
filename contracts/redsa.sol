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
