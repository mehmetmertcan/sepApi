@ALSEP3_410
Feature: Create new purchase resource

  Scenario Outline: Create a new purchase resource

    Given the request body contains valid data:
      | firstName      | <firstName>      |
      | lastName       | <lastName>       |
      | email          | <email>          |
      | phoneNumber    | <phoneNumber>    |
      | lmsProgramCode | <lmsProgramCode> |
      | lmsProgramId   | <lmsProgramId>   |
      | lmsProgramName | <lmsProgramName> |
    Given request accept type is "application/json"
    And request content type is "application/json"
    When I send a POST request to "/purchases"

    Then status code should be 200
    And response content type is "application/json"
    And "data.customer.customerId" field value should be not null
    And "data.customer.firstName" field should be equal "<firstName>"
    And "data.customer.lastName" field should be equal "<lastName>"
    And "data.customer.email" field should be equal "<email>"
    And "data.customer.parent.parentId" field value should be not null


    Examples:
      | firstName | lastName | email            | phoneNumber | lmsProgramCode | lmsProgramId | lmsProgramName                |
      | John      | Doe      | john@email.com   | eeyutuyui   | taws           | 56           | Test Automation with Selenium |
      | Britto    | Smith    | Britto@email.com | 8876543210  | rfep           | 11           | React Front End Program       |
      | Droni     | Dev      | Droni@email.com  | 6876543210  | jss            | 5            | Java Foundation SDET          |
      | Carlo     | Stein    | Carlo@email.com  | 7876543210  | jfft           | 4            | Java Foundation for Teens     |

