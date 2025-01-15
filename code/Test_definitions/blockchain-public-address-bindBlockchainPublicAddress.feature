Feature: CAMARA Blockchain Public Address API, v0.2 - Operation bindBlockchainPublicAddress
  # Input to be provided by the implementation to the tester
  #
  # Implementation indications:
  #
  #
  # Testing assets:
  # * A phone number and several blockchainPublicAddress in order to be able to perform bindings
  #
  #
  # References to OAS spec schemas refer to schemas specifies in blockchain-public-address.yaml, version 0.2.0

  Background: Common bindBlockchainPublicAddress setup
    Given the resource "/blockchain-public-address/v0.2/blockchain-public-addresses"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value
    And the request body is set by default to a request body compliant with the schema

  ##############################
  # Happy path scenarios
  ##############################

  @bind_blockchain_public_address_01_generic_success_scenario
  Scenario: Common validations for any success scenario
    # Valid default request body compliant with the schema
    Given the request body property "$.phoneNumber" is set with a valid phone number
    And the request body property "$.blockchainPublicAddress" is set with a valid value
    And the request body property "$.blockchainNetworkId" is set with a valid value existing in the environment
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 201
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    # The response has to comply with the generic response schema which is part of the spec
    And the response body complies with the OAS schema at "/components/schemas/BindBlockchainPublicAddressResponse"

  @bind_blockchain_public_address_02_generic_success_scenario_with_curreny_information
  Scenario: Common validations for any success scenario with currency information provided
    # Property "$.currency[*]" is set with a valid value supported in the blockChainNetworkId
    Given the request body property "$.phoneNumber" is set with a valid phone number
    And the request body property "$.blockchainPublicAddress" is set with a valid value
    And the request body property "$.blockchainNetworkId" is set with a valid value existing in the environment
    And the request body property "$.$.currency[*]" is set with a valid value supported in the blockChainNetworkId
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 201
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    # The response has to comply with the generic response schema which is part of the spec
    And the response body complies with the OAS schema at "/components/schemas/BindBlockchainPublicAddressResponse"

  ##############################
  # Error scenarios
  ##############################

  # Error 400 scenarios

  @bind_blockchain_public_address_400.01_no_request_body
  Scenario: Missing request body
    Given the request body is not included
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @bind_blockchain_public_address_400.02_empty_request_body
  Scenario: Empty object as request body
    Given the request body is set to "{}"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @bind_blockchain_public_address_400.03_other_input_properties_schema_not_compliant
  # Test other input properties in addition to required ones
  Scenario Outline: Input property values does not comply with the schema
    Given the request body property "<input_property>" does not comply with the OAS schema at <oas_spec_schema>
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

    Examples:
      | input_property          | oas_spec_schema                                         |
      | $.currency              | /components/schemas/BindBlockchainPublicAddressRequest  |

  @bind_blockchain_public_address_400.04_required_input_properties_missing
  Scenario Outline: Required input properties are missing
    Given the request body property "<input_property>" is not included
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

    Examples:
      | input_property                                                    |
      | $.phoneNumber                                                     |
      | $.blockchainPublicAddress                                         |
      | $.blockchainNetworkId                                             |

  @bind_blockchain_public_address_400.05_invalid_blockchainNetworkId
  Scenario: Using a invalid blockchainNetworkId value
    Given the request body property includes property "$.blockchainNetworkId" with a not valid value
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "BLOCKCHAIN_PUBLIC_ADDRESS.INVALID_BLOCKCHAIN_NETWORK_IDENTIFIER"
    And the response property "$.message" contains a user friendly text

  @bind_blockchain_public_address_400.06_invalid_currency
  Scenario: Using a invalid currency value
    Given the request body property includes property "$.currency" with a not valid value supported by blockChainNetworkId
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "BLOCKCHAIN_PUBLIC_ADDRESS.INVALID_CURRENCY"
    And the response property "$.message" contains a user friendly text

  @bind_blockchain_public_address_400.07_missing_currency
  # Optional scenario that may not be required by a Telco Operator
  Scenario: Missing currency
    Given the request body property does not include property "$.currency"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "BLOCKCHAIN_PUBLIC_ADDRESS.CURRENCY_REQUIRED"
    And the response property "$.message" contains a user friendly text

  @bind_blockchain_public_address_C02.01_phone_number_not_schema_compliant
  Scenario: Phone number value does not comply with the schema
    Given the header "Authorization" is set to a valid access which does not identify a single phone number
    And the request body property "$.phoneNumber" does not comply with the OAS schema at "/components/schemas/PhoneNumber"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  # Error 401 scenarios

  @bind_blockchain_public_address_401.01_no_authorization_header
  Scenario: No Authorization header
    Given the header "Authorization" is removed
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @bind_blockchain_public_address_401.02_expired_access_token
  Scenario: Expired access token
    Given the header "Authorization" is set to an expired access token
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @bind_blockchain_public_address_401.03_invalid_access_token
  Scenario: Invalid access token
    Given the header "Authorization" is set to an invalid access token
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  # Error 403 scenarios

  @bind_blockchain_public_address_403.01_invalid_token_permissions
  Scenario: Inconsistent access token permissions
    # To test this, an access token has to be obtained without blockchain-public-address:create scope
    Given the request body is set to a valid request body
    And the header "Authorization" is set to a valid access token emitted without blockchain-public-address:create scope
    When the HTTP "POST" request is sent
    Then the response status code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  @bind_blockchain_public_address_403.02_blockchainNetworkId_not_allowed
  Scenario: blockchainNetworkId not allowed by business
    # To test this, a business context exists in the Telco Operator to not allow a specific blockchainNetworkId
    Given the request body is set to a valid request body
    And the header "Authorization" is set to a valid access token
    When the HTTP "POST" request is sent
    Then the response status code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "BLOCKCHAIN_PUBLIC_ADDRESS.BLOCKCHAIN_NETWORK_IDENTIFIER_NOT_ALLOWED"
    And the response property "$.message" contains a user friendly text

  # Error 409 scenarios

  @bind_blockchain_public_address_409.01_binding_duplicated
  Scenario: binding duplicated
    Given the request body is set to a valid request body
    And the request body property "$.phoneNumber" is set with a valid value
    And the request body property "$.blockchainPublicAddress" is set with a valid value
    And the request body property "$.blockchainNetworkId" is set with a valid value existing in the environment
    And there is an existing binding for above combination of parameters in the environment
    And the header "Authorization" is set to a valid access token
    When the HTTP "POST" request is sent
    Then the response status code is 409
    And the response property "$.status" is 409
    And the response property "$.code" is "ALREADY_EXISTS"
    And the response property "$.message" contains a user friendly text

  ##############################
  ##END
  ##############################