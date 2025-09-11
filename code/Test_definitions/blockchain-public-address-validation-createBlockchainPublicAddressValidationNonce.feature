Feature: CAMARA Blockchain Public Address Validation API, v0.1.0 - Operation createBlockchainPublicAddressValidationNonce
  # Input to be provided by the implementation to the tester
  #
  # Implementation indications:
  #
  #
  # Testing assets:
  # * A valid blockchainPublicAddress in order to be able to generate nonces
  #
  #
  # References to OAS spec schemas refer to schemas specifies in blockchain-public-address-validation.yaml

  Background: Common createBlockchainPublicAddressValidationNonce setup
    Given the resource "/blockchain-public-address-validation/v0.1/blockchain-public-addresses"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"
    And the request body is set by default to a request body compliant with the schema

  ##############################
  # Happy path scenarios
  ##############################

  @create_blockchain_public_address_validation_nonce_01_generic_success_scenario
  Scenario: Common validations for any success scenario
    # Valid default request body compliant with the schema
    Given the request body property "$.blockchainPublicAddress" is set with a valid value
    And the request body is set to a valid request body
    When the request "createBlockchainPublicAddressValidationNonce" is sent
    Then the response status code is 201
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    # The response has to comply with the generic response schema which is part of the spec
    And the response body complies with the OAS schema at "/components/schemas/CreateBlockchainPublicAddressValidationNonceResponse"

  ##############################
  # Error scenarios
  ##############################

  # Error 400 scenarios

  @create_blockchain_public_address_validation_nonce_400.01_no_request_body
  Scenario: Missing request body
    Given the request body is not included
    When the request "createBlockchainPublicAddressValidationNonce" is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @create_blockchain_public_address_validation_nonce_400.02_empty_request_body
  Scenario: Empty object as request body
    Given the request body is set to "{}"
    When the request "createBlockchainPublicAddressValidationNonce" is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @create_blockchain_public_address_validation_nonce_400.03_invalid_blockchainPublicAddress
  Scenario: Using a invalid blockchainPublicAddress value
    Given the request body property includes property "$.blockchainPublicAddress" with a not valid value
    When the request "createBlockchainPublicAddressValidationNonce" is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @create_blockchain_public_address_validation_nonce_400.04_invalid_x-correlator
  Scenario: Invalid x-correlator header
    Given the header "x-correlator" does not comply with the schema at "#/components/schemas/XCorrelator"
    And the request body is set to a valid request body
    When the request "createBlockchainPublicAddressValidationNonce" is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"

  # Error 401 scenarios

  @create_blockchain_public_address_validation_nonce_401.01_no_authorization_header
  Scenario: No Authorization header
    Given the header "Authorization" is removed
    And the request body is set to a valid request body
    When the request "createBlockchainPublicAddressValidationNonce" is sent
    Then the response status code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @create_blockchain_public_address_validation_nonce_401.02_expired_access_token
  Scenario: Expired access token
    Given the header "Authorization" is set to an expired access token
    And the request body is set to a valid request body
    When the request "createBlockchainPublicAddressValidationNonce" is sent
    Then the response status code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @create_blockchain_public_address_validation_nonce_401.03_invalid_access_token
  Scenario: Invalid access token
    Given the header "Authorization" is set to an invalid access token
    And the request body is set to a valid request body
    When the request "createBlockchainPublicAddressValidationNonce" is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  # Error 403 scenarios

  @create_blockchain_public_address_validation_nonce_403.01_invalid_token_permissions
  Scenario: Inconsistent access token permissions
    # To test this scenario, it will be necessary to obtain a token without the required scope
    Given the request body is set to a valid request body
    And the header "Authorization" is set to an access token without the required scope
    When the request "createBlockchainPublicAddressValidationNonce" is sent
    Then the response status code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  ##############################
  ##END
  ##############################