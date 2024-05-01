# VendingMachine

This project is a simple vending machine smart contract developed using Solidity. The vending machine allows users to add items with prices and quantities, and other users can purchase these items by sending Ether to the contract. The contract owner has the ability to manage the items available in the vending machine and withdraw the accumulated funds.

This project is my first application in smart contract

## Functionality Learned

During the development of this project, the following concepts and functionalities were learned:

- **Function Declaration**: Defining functions with specified visibility, state mutability, and return types.
- **Visibility**: Understanding the visibility of functions as public, private, internal, and external.
- **State Mutability**: Identifying the state mutability of functions as view, pure, and payable.
- **Return Types**: Specifying the return type and data location (memory, storage, calldata) for function returns.



### Installing

Clone this repository:

```bash
git clone https://github.com/aminal22/vending-machine.git
```

Install dependencies:

```bash
cd vending-machine
npm install
```

## Usage

1. Deploy the contract to a local blockchain or a testnet.
2. Add items to the vending machine using the `addItem` function.
3. Users can purchase items by calling the `purchaseItem` function and sending Ether.
4. The contract owner can withdraw the contract balance using the `withdraw` function.


## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

