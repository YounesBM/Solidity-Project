// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21;

contract ShippingContract {

    uint amount = 1;
    address sender;
    address receiver;
    address payable internal deliverer = payable(0xc71fDbDE4938D7605528FD998a7a5F5420eAbB6A);
    enum ShippingState {Pending, Shipped, Delivered}
    
    ShippingState public shippingState;

    modifier senderOnly() {
        require(
            msg.sender == sender,
            "Seul l'expediteur peut appeler cette fonction."
        );
        _;
    }

    modifier receiverOnly() {
        require(
            msg.sender == receiver,
            "Seul le destinataire peut appeler cette fonction."
        );
        _;
    }

    modifier inShippingState(ShippingState _shippingState) {
        require(
            shippingState == _shippingState,
            "L'etat de la livraison est incorrect."
        );
        _;
    }

    event Pending(string _message);
    event Shipped(string _message);
    event ItemDelivered(string _message);

    function fetchShippingState() public view returns (ShippingState) {
        return shippingState;
    }

    function confirmShipping() public senderOnly inShippingState(ShippingState.Pending) {
        emit Shipped("Item successfully shipped");
        shippingState = ShippingState.Shipped;
        receiver = msg.sender;
    }

    function confirmDelivery() public receiverOnly inShippingState(ShippingState.Shipped) {
        emit ItemDelivered("Item successfully delivered.");
        shippingState = ShippingState.Delivered;
    }

    function sendDelivererTips(uint _amount) external {
        deliverer.transfer(_amount);
    }

    constructor() public {
        shippingState = ShippingState.Pending;
        sender = msg.sender;
    }

}