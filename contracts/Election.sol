pragma solidity >=0.4.22 <0.9.0;
// SPDX-License-Identifier: MIT

contract Election {
    struct Candidate {
        uint256 id;
        string name;        
        uint256 voteCount;
        string img;
        
    }

    mapping(uint256 => Candidate) public candidates;

    mapping(address => bool) public voters;

    uint256 public candidatesCount;

    // voted event
    //event votedEvent(uint256 indexed _candidateId);
    //public
    function addCandidate(string memory _name, string memory _img) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0, _img );
    } 

    constructor() public {
        addCandidate("Daniel","../candidates/cand1.jpg");
        addCandidate("John " ,"../candidates/cand2.jpg");
        addCandidate("Onyango ", "../candidates/cand3.jpg");
        addCandidate("Joan ", "../candidates/cand4.jpg");
        addCandidate("Ochieng ", "../candidates/cand5.jpg");
        addCandidate("Kamau ", "../candidates/cand6.jpg");
        addCandidate("Kimani ", "../candidates/cand7.jpg");
        addCandidate("Nkuriki ", "../candidates/cand8.jpg");
        addCandidate("Mohammed ", "../candidates/cand9.jpg");
        addCandidate("Sakai ", "../candidates/cand10.jpg");
        addCandidate("Kiptoo ", "../candidates/cand11.jpg");
        addCandidate("Kipruto ", "../candidates/cand12.jpg");
        addCandidate("Gabriel ", "../candidates/cand13.jpg");
        addCandidate("Karua ", "../candidates/cand14.jpg");
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
