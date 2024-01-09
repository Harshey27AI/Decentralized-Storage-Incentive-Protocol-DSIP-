// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedGovernance {

    address public owner;
    mapping(address => bool) public admins;
    
    // Define events for better transparency
    event AdminAdded(address indexed admin);
    event AdminRemoved(address indexed admin);
    event ProposalSubmitted(uint256 indexed proposalId, string proposalDescription);
    event ProposalExecuted(uint256 indexed proposalId);
    event ProposalRejected(uint256 indexed proposalId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier onlyAdmin() {
        require(admins[msg.sender], "Only admins can call this function");
        _;
    }

    struct Proposal {
        string description;
        bool executed;
    }

    Proposal[] public proposals;

    constructor() {
        owner = msg.sender;
        admins[msg.sender] = true;
    }

    function addAdmin(address _admin) external onlyOwner {
        admins[_admin] = true;
        emit AdminAdded(_admin);
    }

    function removeAdmin(address _admin) external onlyOwner {
        admins[_admin] = false;
        emit AdminRemoved(_admin);
    }

    function submitProposal(string memory _description) external onlyAdmin {
        uint256 proposalId = proposals.length;
        proposals.push(Proposal(_description, false));
        emit ProposalSubmitted(proposalId, _description);
    }

    function executeProposal(uint256 _proposalId) external onlyAdmin {
        require(_proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.executed, "Proposal already executed");

        // Implement the logic to execute the proposal
        // For simplicity, let's just mark it as executed in this example
        proposal.executed = true;

        emit ProposalExecuted(_proposalId);
    }

    function rejectProposal(uint256 _proposalId) external onlyAdmin {
        require(_proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.executed, "Executed proposals cannot be rejected");

        // Implement the logic to reject the proposal
        // For simplicity, let's just mark it as rejected in this example
        proposal.executed = true;

        emit ProposalRejected(_proposalId);
    }
}
