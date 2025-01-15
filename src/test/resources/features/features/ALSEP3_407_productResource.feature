@ALSEP3-407
Feature: Retrieve Product Resource by Product Code As a user
  I want to retrieve product details using the product code
  So that I can validate the fields in the response
#Positive test
Scenario Outline: User can get any product resource by program code "<programCode>".
Given request accept type is "application/json"
And path param "lmsProgramCode" is "<programCode>"
When I sent GET request to "/products/{lmsProgramCode}" endpoint
Then status code should be 200
And response content type is "application/json"
And "data.productId" field value should be not null
And "data.productId" field should be equal "<productId>"
And "data.lmsProgramId" field should be equal "<programId>"
And "data.lmsProgramName" field should be equal "<programName>"
And "data.isForTeens" field should be equal "<teensResult>"

Examples:
| programCode | productId | programId | programName                   | teensResult |
| taws        | 1         | 56        | Test Automation with Selenium | false       |
| rfep        | 2         | 11        | React Front End Program       | false       |
| jfft        | 3         | 4         | Java Foundations for Teens    | true        |
| jss         | 4         | 5         | Java Selenium SDET            | false       |

#Negative Test
  Scenario Outline: Verify the API returns an error for invalid or missing program codes
    Given the API endpoint "GET/api/v1/products/{lmsProgramCode}" is accessible
   When the user sends a GET request with an invalid or missing program code "<programCode>"
   Then the response status code should be <statusCode>
    And the response Content-Type should be "<contentType>"
    And the response body should contain an error message "<errorMessage>"

    Examples:
      | programCode    | statusCode | contentType        | errorMessage                     |
      | invalidCode    | 404        | application/json   | Product could not be found.      |
      | 12345          | 404        | application/json   | Product could not be found.      |
      | @specialChars  | 404        | application/json   | Product could not be found.      |
      | null           | 404        | application/json   | Product could not be found.      |

  Scenario: User cannot retrieve product resource with an invalid program code "invalidCode"
    Given request accept type is "application/json"
    And path param "lmsProgramCode" is "invalidCode"
    When I send GET request to "/products/{lmsProgramCode}" endpoint
    Then status code should be 404
    And response content type is "application/json"
    And response body should contain the error message "Product could not be found."

  Scenario: User cannot retrieve product resource with numeric program code "12345"
    Given request accept type is "application/json"
    And path param "lmsProgramCode" is "12345"
    When I send GET request to "/products/{lmsProgramCode}" endpoint
    Then status code should be 404
    And response content type is "application/json"
    And response body should contain the error message "Product could not be found."

  Scenario: User cannot retrieve product resource with special characters in program code "@SpecialChars"
    Given request accept type is "application/json"
    And path param "lmsProgramCode" is "@SpecialChars"
    When I send GET request to "/products/{lmsProgramCode}" endpoint
    Then status code should be 404
    And response content type is "application/json"
    And response body should contain the error message "Product could not be found."

  Scenario: User cannot retrieve product resource with null program code
    Given request accept type is "application/json"
    And path param "lmsProgramCode" is "null"
    When I send GET request to "/products/{lmsProgramCode}" endpoint
    Then status code should be 404
    And response content type is "application/json"
    And response body should contain the error message "Product could not be found."
    #
#
