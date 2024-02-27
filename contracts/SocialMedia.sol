// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SocialMedia{

    address public owner;

    struct User{
        uint id;
        string userName;
        string profilePicture;
        string bio;
        uint followerCount;
        uint256[]ownedNFTs;
        bool hasSignedUp;
    }

    struct Post{
        uint256 postId;
        string content;
        uint256 nftId;
        uint256 likesCount;
        Comment[] comments;
    }


    struct NFT{
        uint id;
    }

    struct Group{
        uint256 groupId;
        string name;
        string description;
        address[] members;
    }

    struct Comment{
        uint256 commentId;
        uint256 likesCount;
    }

    mapping(address => User) public users;
    mapping(address => Post) public posts;
    mapping(uint256 =>NFT) public nfts;
    mapping(uint => Comment[]) public commentByNFT;
    mapping(uint256 => Group) public groups;

    constructor(){
        owner = msg.sender;
    }

    function registerNewUser(string memory _username, string memory _bio) public {
    require(users[msg.sender].id == 0, "User already exists");
    User memory newUser = User({
        id: // generate a unique id for the new user,
        userName: _username,
        bio: _bio,
        followerCount: 0,
        ownedNFTs: new uint256[](0),
        hasSignedUp: true
    });
    users[msg.sender] = newUser;
}

}