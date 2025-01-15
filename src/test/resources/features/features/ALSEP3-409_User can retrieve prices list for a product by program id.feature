@wip
Feature: Retrieve price list for a product
  I want to retrieve product price list by using the program id
  So that I can validate the fields in the response

  Scenario Outline: User can retrieve prices list for a product by program id
    Given request accept type is "application/json"
    When I sent GET request to "/products/<lmsProgramId>/prices" endpoint
    Then status code should be 200
    And response content type is "application/json"
    And "data.prices.priceId" field value should be not null
    And "data.prices.type" field value should be not null
    And "data.prices.allowCoupons" field value should be not null
    And "data.prices.receipt.paymentType" field value should be not null
    And "data.prices[0].allowCoupons" field should be equal "<allowCoupons>"

    And "data.prices" has "<paymentType>"




    Examples:
      | programCode | lmsProgramId | allowCoupons | paymentType                                                                                    |
      | taws        | 56           | true         | price_1OXpPoJmxFuDfdznFNJZKs0I , price_1OXpPoJmxFuDfdznRZujBIls                                |
      | rfep        | 11           | false        | price_1OldasJmxFuDfdzn0IcbtmL5 , price_1OldaZJmxFuDfdznuV7zGNGW                                |
      | jfft        | 4            | false        | price_1OldcmJmxFuDfdzn1QAj12tY                                                                 |
      | jss         | 5            | false        | price_1OldgAJmxFuDfdznaWeLCRMX, price_1Oldg1JmxFuDfdznf37D3cie, price_1OldfGJmxFuDfdznUehAmuV2 |


