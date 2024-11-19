// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.6;

contract Twitter {
    uint16 public MAX_TWEET_LENGTH = 280;

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    // Mapping to associate users with their tweets
    mapping(address => Tweet[]) private tweets;

    // Only the deployer can modify certain aspects
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Allow the owner to change the max tweet length
    function changeTweetLength(uint16 _newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = _newTweetLength;
    }

    // Create a new tweet
    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is too long");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    // Get a specific tweet by a user
    function getTweet(address _user, uint256 _index) public view returns (Tweet memory) {
        require(_index < tweets[_user].length, "Invalid index");
        return tweets[_user][_index];
    }

    // Get all tweets by a user
    function getAllTweets(address _user) public view returns (Tweet[] memory) {
        return tweets[_user];
    }
}
