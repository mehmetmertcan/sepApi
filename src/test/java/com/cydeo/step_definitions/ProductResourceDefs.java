package com.cydeo.step_definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.http.ContentType;
import org.hamcrest.Matchers;

public class ProductResourceDefs extends TestBase {


    @Given("the API endpoint {string} is accessible")
    public void the_api_endpoint_is_accessible(String endPoint) {
        givenPart.pathParam("ImsProgramCode","invalidCode");
        response = givenPart.when().get(endPoint);
        thenPart = response.then();
        jp = response.jsonPath();
        String endpointwithparam = endPoint.replace("{ImsProgramCode}","invalidCode");
        response = givenPart.when().get(endpointwithparam);
        System.out.println("endPoint = " + endPoint);
        System.out.println("endpointwithparam = " + endpointwithparam);

    }



    @When("the user sends a GET request with an invalid or missing program code {string}")
    public void the_user_sends_a_get_request_with_an_invalid_or_missing_program_code(String programCode) {
       response = givenPart.pathParam("lmsProgramCode",programCode)
                .accept(ContentType.JSON)
                .when().get("/products/{lmsProgramCode}");
       thenPart = response.then();
       jp = response.jsonPath();
        System.out.println("programCode = " + programCode);


    }

    @Then("the response status code should be {int}")
    public void the_response_status_code_should_be(int expectedStatusCode) {
        thenPart.statusCode(expectedStatusCode);
        System.out.println("expectedStatusCode = " + expectedStatusCode);

    }

    @Then("the response Content-Type should be {string}")
    public void the_response_content_type_should_be(String expectedContentType) {
        thenPart.contentType(expectedContentType);
        System.out.println("expectedContentType = " + expectedContentType);

    }

    @Then("the response body should contain an error message {string}")
    public void the_response_body_should_contain_an_error_message(String expectedBody) {
        thenPart.body("errorMessage",Matchers.equalTo(expectedBody));
        System.out.println("expectedBody = " + expectedBody);

    }


    @When("I send GET request to {string} endpoint")
    public void iSendGETRequestToEndpoint(String pointEnd) {
        response = givenPart.when().get(pointEnd);
        thenPart = response.then();
        jp = response.jsonPath();
        System.out.println("pointEnd = " + pointEnd);


    }

    @And("response body should contain the error message Product could not be found")
    public void responseBodyShouldContainTheErrorMessageProductCouldNotBeFound(String expectbody) {
        thenPart.body("errorMessage",Matchers.equalTo(expectbody));
        System.out.println("expectbody = " + expectbody);
    }


    @And("response body should contain the error message {string}")
    public void responseBodyShouldContainTheErrorMessage(String expectBody) {
        thenPart.body("errorMessage",Matchers.equalTo(expectBody));
        System.out.println("expectBody = " + expectBody);

    }


}







