package com.cydeo.step_definitions;

import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;

public class TestBase {


    static RequestSpecification givenPart = RestAssured.given().log().uri();
    static Response response;
    static JsonPath jp;
    static ValidatableResponse thenPart;

}
