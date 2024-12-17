@ALSEP3-414
Feature: Submitting a promo code

  As a user i want to submit a promo code

  Scenario Outline: Submit valid promo code "off50" and validate success
    Given request accept type is "application/json"
    When the user has the priceId "price_1OXpPoJmxFuDfdznFNJZKs0I" , productId "prod_PMYWvWHeM3LeY9" and the promoCode is "off50"
    When I sent POST request to "/plans/promo-code" endpoint
    Then status code should be 200
    And response content type is "application/json"
    And "data.promoCode" field should be equal "<promoCode>"
    And "data.isValid" field should be equal "<isValid>"
    And "data.message" field should be equal "<message>"
    And "data.receipt.paymentSummary.basePrice" field in the response should be an integer
    And "data.receipt.paymentSummary.basePrice" field should be equal "<basePrice>"
    And "data.receipt.paymentSummary.currency" field should be equal "<currency>"


    Examples:
      | promoCode | isValid | message       | basePrice | currency |
      | off50     | true    | Valid Coupon! | 500       | usd      |



  Scenario Outline: Submit expired promo code "exp50" and validate response
    Given request accept type is "application/json"
    When the user has the priceId "price_1OXpPoJmxFuDfdznFNJZKs0I" , productId "prod_PMYWvWHeM3LeY9" and the promoCode is "exp50"
    When I sent POST request to "/plans/promo-code" endpoint
    Then status code should be 200
    And response content type is "application/json"
    And "data.promoCode" field should be equal "<promoCode>"
    And "data.isValid" field should be equal "<isValid>"
    And "data.message" field should be equal "<message>"



    Examples:
      | promoCode | isValid | message                     |
      | exp50     | false   | Coupon is no longer active. |



  Scenario Outline: Submit promo code other than "exp50" and "off50" and validate response
    Given request accept type is "application/json"
    When the user has the priceId "price_1OXpPoJmxFuDfdznFNJZKs0I" , productId "prod_PMYWvWHeM3LeY9" and the promoCode is "exp55"
    When I sent POST request to "/plans/promo-code" endpoint
    Then status code should be 200
    And response content type is "application/json"
    And "data.promoCode" field should be equal "<promoCode>"
    And "data.isValid" field should be equal "<isValid>"
    And "data.message" field should be equal "<message>"



    Examples:
      | promoCode | isValid | message         |
      | exp55     | false   | Invalid Coupon. |



