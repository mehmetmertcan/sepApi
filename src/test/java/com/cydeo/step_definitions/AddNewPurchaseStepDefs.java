package com.cydeo.step_definitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.restassured.http.ContentType;

import java.util.Map;

public class AddNewPurchaseStepDefs extends TestBase {
    @Given("the request body contains valid data:")
    public void theRequestBodyContainsValidData(io.cucumber.datatable.DataTable dataTable) {
        // Convert DataTable to a Map
        Map<String, String> requestBodyMap = dataTable.asMap(String.class, String.class);
        System.out.println("requestBody = " + requestBodyMap);

        String requestBody = "{\n" +
                "  \"customer\": {\n" +
                "    \"firstName\": \""+requestBodyMap.get("firstName")+"\",\n" +

                "    \"lastName\":\""+requestBodyMap.get("lastName")+"\",\n" +
                "    \"email\": \""+requestBodyMap.get("email")+"\",\n" +
                "    \"phoneNumber\":\""+requestBodyMap.get("phoneNumber")+"\",\n" +
                "    \"referralSource\": \"\",\n" +
                "    \"parent\": {\n" +
                "      \"firstName\": \"\",\n" +
                "      \"lastName\": \"\",\n" +
                "      \"email\": \"\",\n" +
                "      \"phoneNumber\": \"\"\n" +
                "    }\n" +
                "  },\n" +
                "  \"referralSource\": \"\",\n" +
                "  \"product\": {\n" +
                "    \"lmsProgramCode\":\""+requestBodyMap.get("lmsProgramCode")+"\",\n" +
                "    \"lmsProgramId\": \""+requestBodyMap.get("lmsProgramId")+"\",\n" +
                "    \"lmsProgramName\": \""+requestBodyMap.get("lmsProgramName")+"\"" +
                "  }\n" +
                "}";

        System.out.println("requestBody = " + requestBody);
        // Set the request body for the upcoming request
        givenPart.accept(ContentType.JSON).body(requestBody).contentType(ContentType.JSON);
    }
    @When("I send a POST request to {string}")
    public void i_send_a_post_request_to(String endpoint) {
        response = givenPart.when().post(endpoint);
        response.prettyPrint();
        thenPart = response.then();
        jp = response.jsonPath();
    }

}
