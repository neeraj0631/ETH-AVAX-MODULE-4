// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DegenGamingToken {
    string public constant name = "Degen Gaming Token";
    string public constant symbol = "DGT";
    uint8 public constant decimals = 18;
    uint256 public totalSupply;

    address public owner;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    mapping(uint256 => uint256) public itemCosts; // Store item IDs and their corresponding token costs

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Burn(address indexed burner, uint256 value);
    event Redeem(address indexed user, uint256 itemId, uint256 cost);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor(uint256 initialSupply) {
        owner = msg.sender;
        totalSupply = initialSupply * 10**uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 value) external returns (bool) {
        require(to != address(0), "Invalid recipient");
        require(value <= balanceOf[msg.sender], "Insufficient balance");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        require(to != address(0), "Invalid recipient");
        require(value <= balanceOf[from], "Insufficient balance");
        require(value <= allowance[from][msg.sender], "Allowance exceeded");

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }

    function mint(address to, uint256 value) external onlyOwner {
        require(to != address(0), "Invalid recipient");
        totalSupply += value;
        balanceOf[to] += value;
        emit Transfer(address(0), to, value);
    }

    function burn(uint256 value) external {
        require(value <= balanceOf[msg.sender], "Insufficient balance");
        balanceOf[msg.sender] -= value;
        totalSupply -= value;
        emit Burn(msg.sender, value);
    }

    function setItemCost(uint256 itemId, uint256 cost) external onlyOwner {
        itemCosts[itemId] = cost;
    }

    function redeem(uint256 itemId) external {
        require(itemCosts[itemId] > 0, "Invalid item ID");
        require(balanceOf[msg.sender] >= itemCosts[itemId], "Insufficient balance for redemption");

        uint256 cost = itemCosts[itemId];
        balanceOf[msg.sender] -= cost;
        emit Redeem(msg.sender, itemId, cost);
    }
}

