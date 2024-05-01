// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract VendingMachine {
    address public owner;

    mapping(string => uint256) public itemPrices;
    mapping(string => uint256) public itemQuantities;

    event ItemAdded(string itemId, uint256 price, uint256 quantity);
    event ItemPurchased(string itemId, address buyer, uint256 quantity);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addItem(string memory itemId, uint256 price, uint256 quantity) public onlyOwner {
        require(price > 0, "Price must be greater than zero");
        itemPrices[itemId] = price;
        itemQuantities[itemId] = quantity;
        emit ItemAdded(itemId, price, quantity);
    }

    function purchaseItem(string memory itemId, uint256 quantity) public payable {
        require(quantity > 0, "Quantity must be greater than zero");
        uint256 price = itemPrices[itemId];
        require(price > 0, "Item does not exist");
        uint256 totalCost = price * quantity;
        require(msg.value >= totalCost, "Insufficient payment");

        uint256 availableQuantity = itemQuantities[itemId];
        require(availableQuantity >= quantity, "Not enough quantity in stock");

        itemQuantities[itemId] -= quantity;
        payable(owner).transfer(msg.value);
        emit ItemPurchased(itemId, msg.sender, quantity);
    }

    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    receive() external payable {}
}
