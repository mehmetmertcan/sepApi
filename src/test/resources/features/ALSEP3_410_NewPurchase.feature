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
    When I send a POST request to "/purchases"
    Then status code should be 200
    And response content type is "application/json"
    And "data.customer.customerId" field value should be not null
    And "data.customer.firstName" field should be equal "<firstName>"
    And "data.customer.lastName" field should be equal "<lastName>"
    And "data.customer.email" field should be equal "<email>"
    And "data.customer.parent.parentId" field value should be not null


    Examples:
      | firstName | lastName | email            | phoneNumber | productId | lmsProgramCode | lmsProgramId | lmsProgramName                | teensResult |
      | John      | Doe      | john@email.com   | 1234567890  | 1         | taws           | 56           | Test Automation with Selenium | false       |
      | Britto    | Smith    | Britto@email.com | 8876543210  | 2         | rfep           | 11           | React Front End Program       | false       |
      | Carlo     | Stein    | Carlo@email.com  | 7876543210  | 3         | jfft           | 4            | Java Foundation for Teens     | true        |
      | Droni     | Dev      | Droni@email.com  | 6876543210  | 4         | jss            | 5            | Java Foundation SDET          | true        |