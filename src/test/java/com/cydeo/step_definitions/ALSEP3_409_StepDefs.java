package com.cydeo.step_definitions;

import io.cucumber.java.en.And;
import org.junit.Assert;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ALSEP3_409_StepDefs extends TestBase {

    @And("{string} has {string}")
    public void has(String path, String expectedValue) {

        // Get the prices array from the response
        List<Map<String, Object>> prices = jp.getList(path); // Extract the 'prices' array

        // Extract all priceIds from the prices array
        List<String> actualValues = prices.stream()
                .map(price -> (String) price.get("priceId")) // Extract 'priceId' from each map
                .collect(Collectors.toList());

        // Print debug information
        System.out.println("-----------------");
        System.out.println("actualValues = " + actualValues);
        System.out.println("expectedValue = " + expectedValue);
        System.out.println("-----------------");

        // Split the expected value into a list (in case multiple values are provided in the feature file)
        List<String> expectedValuesList = Arrays.asList(expectedValue.split("\\s*,\\s*")); // Split by comma and remove extra spaces

        // Assert that both priceId values are included in the actual values
        Assert.assertTrue(actualValues.containsAll(expectedValuesList));

    }
}
