import React from "react";
import { newContextComponents } from "@drizzle/react-components";
import logo from "./logo.png";

const { AccountData, ContractData, ContractForm } = newContextComponents;

export default ({ drizzle, drizzleState }) => {
  // destructure drizzle and drizzleState from props
  return (

    <div className="App">
      <div>
        <img src={logo} alt="drizzle-logo" />
        <h1>Drizzle Shipping Contract</h1>
        <p>
          Shipping Contract
        </p>
      </div>

      <div className="section">
        <h2>ShippingContract</h2>
        <p>
          <strong>Delivery Status: </strong>
          <ContractData
            drizzle={drizzle}
            drizzleState={drizzleState}
            contract="ShippingContract"
            method="sendDelivererTips"
          />
          <h3>Confirm Shipping</h3>
          <ContractForm
            drizzle={drizzle}
            contract="ShippingContract"
            method="confirmShipping"
          />
          <h3>Confirm Delivery</h3>
          <ContractForm
            drizzle={drizzle}
            contract="ShippingContract"
            method="confirmDelivery"
          />
          <h3>Send Tips To Deliverer</h3>
          <ContractForm
            drizzle={drizzle}
            drizzleState={drizzleState}
            contract="ShippingContract"
            method="sendDelivererTips"
          />
        </p>
      </div>
    </div>
    
  );
};
