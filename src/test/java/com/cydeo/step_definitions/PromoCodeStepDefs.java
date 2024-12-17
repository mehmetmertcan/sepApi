package com.cydeo.step_definitions;

import io.cucumber.java.en.*;

import java.util.LinkedHashMap;
import java.util.Map;

import static org.hamcrest.Matchers.*;

public class PromoCodeStepDefs extends TestBase{


    @When("I sent POST request to {string} endpoint")
    public void i_sent_post_request_to_endpoint(String endpoint) {

        response = givenPart.
                when().post(endpoint);
        thenPart = response.then();
        jp = response.jsonPath();
    }

    @When("the user has the priceId {string} , productId {string} and the promoCode is {string}")
    public void theUserHasThePriceIdProductIdAndThePromoCodeIs(String priceId, String productId, String promoCode) {

        // Explicitly set Content-Type to application/json
        givenPart
                .header("Content-Type", "application/json")
                .body("{\"priceId\":\"" + priceId + "\", \"productId\":\"" + productId + "\", \"promoCode\":\"" + promoCode + "\"}");


    }


    @And("{string} field in the response should be an integer")
    public void fieldInTheResponseShouldBeAnInteger(String basePrice) {

        System.out.println(" Actual base price: "+ jp.getString("data.receipt.paymentSummary.basePrice"));
        System.out.println("basePrice = " + basePrice);
        thenPart.body(basePrice, instanceOf(Integer.class));
    }
}
