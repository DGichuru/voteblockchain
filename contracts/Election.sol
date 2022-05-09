pragma solidity >=0.4.22 <0.9.0;
// SPDX-License-Identifier: MIT

contract Election {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    mapping(uint256 => Candidate) public candidates;

    mapping(address => bool) public voters;

    uint256 public candidatesCount;

    // voted event
    //event votedEvent(uint256 indexed _candidateId);
    //public
    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    } 

    constructor() public {
        addCandidate("Daniel ");
        addCandidate("John ");
        addCandidate("Onyango ");
        addCandidate("Joan ");
    }

    

    function vote(uint256 _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount++;

        // trigger voted event
        //emit votedEvent(_candidateId);
    }
}
