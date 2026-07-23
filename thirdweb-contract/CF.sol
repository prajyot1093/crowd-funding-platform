// SPDX-License-Identifier: UNIDENTIFIED
pragma solidity ^0.8.18;
contract CF {
    struct campaign {
        uint target;
        address owner;
        string title;
        string description;
        uint256 ammount;
        uint256 deadline;
        string img;
        address[] donators;
        uint256[] donations;
    }
    mapping(uint256 => campaign) public campaigns;
    uint256 public numberofCampaigns = 0;

    function createCampaign(
        address _owner,
        string memory _title,
        string memory _description,
        uint256 _target,
        uint256 _deadline,
        string memory _image
    )public returns (uint256) {

        campaign storage newCampaign = campaigns[numberofCampaigns];
        require(_deadline > block.timestamp, "deadline should be a date in the future");
        newCampaign.owner = _owner;
        newCampaign.title = _title;
        newCampaign.target = _target;
        newCampaign.description = _description;
        newCampaign.ammount = 0;
        newCampaign.deadline = _deadline;
        newCampaign.img = _image;
       
        numberofCampaigns++;
        return numberofCampaigns -1;



    }

    function donatetoCampaign(uint256 _id) public payable{
        uint256 amount = msg.value;
        campaign storage newCampaign = campaigns[_id];
        newCampaign.donators.push(msg.sender);
        newCampaign.donations.push(amount);

        (bool sent ,) = payable(newCampaign.owner).call{value : amount}("");
        
        if(sent) {
            newCampaign.ammount = newCampaign.ammount + amount;
        }
    
    
    }

    function getDonators(uint256 _id) public view returns(address[] memory, uint256[] memory) {
        return (campaigns[_id].donators, campaigns[_id].donations);
    }

    function getCampaigns() public view returns(campaign[] memory) {
        campaign[] memory allCampaigns = new campaign[](numberofCampaigns);
        for(uint i = 0; i < numberofCampaigns; i++){
            allCampaigns[i] = campaigns[i];
        }
        return allCampaigns;
    }
}
