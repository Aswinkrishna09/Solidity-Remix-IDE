// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract CrowdFunding {
    mapping(address => uint256) public Contributions;
    address public Manager;
    uint256 public minContribution;
    uint256 public deadline;
    uint256 public target;
    uint256 public raisedAmount;
    uint256 public noOfContributors;

    struct Request {
        string description;
        address payable recepiant;
        uint256 value;
        bool isCompleted;
        uint256 noOfVoters;
        mapping(address => bool) voters;
    }
    mapping(uint256 => Request) public requests;
    uint256 public numRequest;

    constructor(uint256 _deadline, uint256 _target) {
        deadline = block.timestamp + _deadline;
        target = _target;
        Manager = msg.sender;
        minContribution = 100 wei;
    }

    function sendEth() external payable {
        require(block.timestamp < deadline, "Deadline has Elapsed");
        require(msg.value >= 100 wei, "Minimum contribution not met");
        if (Contributions[msg.sender] == 0) {
            noOfContributors++;
        }
        Contributions[msg.sender] += msg.value;
        raisedAmount += msg.value;
    }

    function refund() external {
        require(
            block.timestamp > deadline && raisedAmount < target,
            "You are not eligible"
        );
        require(Contributions[msg.sender] > 0);
        payable(msg.sender).transfer(Contributions[msg.sender]);
        Contributions[msg.sender] = 0;
    }

    modifier OnlyManager() {
        require(msg.sender == Manager, "Only Manager can call this function");
        _;
    }

    function createRequest(
        string memory _description,
        address payable _recepiant,
        uint256 _value
    ) external OnlyManager {
        Request storage newRequest = requests[numRequest];
        numRequest++;
        newRequest.description = _description;
        newRequest.recepiant = _recepiant;
        newRequest.value = _value;
        newRequest.isCompleted = false;
        newRequest.noOfVoters = 0;
    }

    function VoteRequest(uint256 _requestno) public {
        require(Contributions[msg.sender] > 0, "You are not eligible");
        Request storage thisRequest = requests[_requestno];
        require(thisRequest.voters[msg.sender] == false, "You voted already");
        thisRequest.voters[msg.sender] = true;
        thisRequest.noOfVoters++;
    }

    function makePayment(uint256 _requestno) public OnlyManager {
        require(raisedAmount >= target);
        Request storage thisRequest = requests[_requestno];
        require(thisRequest.isCompleted == false, "Already Completed");
        require(
            thisRequest.noOfVoters >= noOfContributors / 2,
            "Majority not met"
        );
        thisRequest.recepiant.transfer(thisRequest.value);
        thisRequest.isCompleted = true;
    }
}
