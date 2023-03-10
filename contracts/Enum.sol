// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Enums {
    enum Status {
        None,
        Pending,
        Booked,
        Shipped,
        Completed,
        Rejected,
        Cancelled
    }
    Status public status;

    struct Order {
       // address owner;
        uint256 orderId;
        uint256 product_count;
        string product_name;
        Status status;
    }
    address public owner;
    // Order[] public orders;
    mapping(address => Order[]) public buyers;
    mapping(address => bool) private buyersExist;

    constructor() {
        owner = msg.sender;
    }

    modifier OnlyAdmin() {
        require(owner == msg.sender, "Only Admin can Update");
        _;
    }

    function get() external view returns (Status) {
        return status;
    }

    function set(Status _status) external {
        status = _status;
    }

    function ship() external {
        status = Status.Shipped;
    }

    function reset() external {
        delete status;
    }

    function buyProduct(
        string memory _product_name,
        uint256 _orderId,
        uint256 _product_count
    ) external {
        buyers[msg.sender].push(
            Order(
                //msg.sender,
                _orderId,
                _product_count,
                _product_name,
                Status.Booked
            )
        );
        if (!buyersExist[msg.sender]) {
            buyersExist[msg.sender] = true;
        }
    }
    //0xd9145CCE52D386f254917e481eB44e9943F39138 contract address already deployed
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 //admin
// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
// 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
// 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB
// 0x617F2E2fD72FD9D5503197092aC168c91465E7f2
// 0x17F6AD8Ef982297579C203069C1DbfFE4348c372
// 0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678
// 0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7
// 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C
    function setOrders(Status _status, address _buyer ,uint _orderId) external OnlyAdmin {
        Order[] storage ordersList = buyers[_buyer];
        for(uint i=0;i<ordersList.length;i++){
            if(ordersList[i].orderId==_orderId){
                ordersList[i].status = _status;
            }
        }
    }
}
