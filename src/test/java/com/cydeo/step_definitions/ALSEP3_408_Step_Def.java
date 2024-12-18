package com.cydeo.step_definitions;
import io.cucumber.java.en.Then;
import org.junit.Assert;

public class ALSEP3_408_Step_Def extends TestBase{

    @Then("{string} field value should be {string}")
    public void fieldValueShouldBe(String path, String value) {
        String actualValue = jp.getString(path);

        System.out.println("Actual value of '" + path + "' = " + actualValue);
        Assert.assertEquals("The value of " + path + " should  be " + value, value, actualValue);
    }
}












