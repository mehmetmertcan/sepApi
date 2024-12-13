package com.cydeo.step_definitions;


import com.cydeo.utilities.ConfigurationReader;
import io.cucumber.java.Before;
import io.restassured.RestAssured;

public class Hooks {

   @Before
   public void initBaseUri(){

       RestAssured.baseURI= ConfigurationReader.getProperty("baseUri");
   }
    
}
