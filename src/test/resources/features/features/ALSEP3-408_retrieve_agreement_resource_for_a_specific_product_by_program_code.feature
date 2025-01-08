@ALSEP-408
Feature: Retrieve agreement resource for a specific product by program code

  Scenario Outline: Agreement endpoint

    Given request accept type is "application/json"
    When I sent GET request to "/products/<programCode>/agreement" endpoint
    Then status code should be 200
    And response content type is "application/json"
    Then "data.agreementId" field value should be "1"


    Examples:
      | programCode |
      | taws        |
      | jss         |
      | rfep        |
      | jfft        |


  #Negative
  Scenario Outline:
    Given request accept type is "application/json"
    When I sent GET request to "/products/<programCode>/agreement" endpoint
    Then status code should be 404
    And response content type is "application/json"
    Then "error.message" field value should be "Product for the requested program could not be found."

    Examples:
      | programCode |
      | tap        |

