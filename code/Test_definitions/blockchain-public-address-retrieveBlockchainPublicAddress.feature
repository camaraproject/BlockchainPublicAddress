Feature: CAMARA Blockchain Public Address API, v0.2 - Operation retrieveBlockchainPublicAddress
  # Input to be provided by the implementation to the tester
  #
  # Implementation indications:
  #
  #
  # Testing assets:
  # * A phone number with several existing bindings to be able to perform queries
  #
  #
  # References to OAS spec schemas refer to schemas specifies in blockchain-public-address.yaml, version 0.2.0

  Background: Common retrieveBlockchainPublicAddress setup
    Given the resource "/blockchain-public-address/v0.2//blockchain-public-addresses/retrieve-blockchains"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value
    And the request body is set by default to a request body compliant with the schema

  ##############################
  # Happy path scenarios
  ##############################

  @retrieve_blockchain_public_address_01_generic_success_scenario
  Scenario: Common validations for any success scenario
    Given an existing binding created by operation bindBlockchainPublicAddress for a given phoneNumber
    And the request body property "$.phoneNumber" is set with the value of above phoneNumber
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    # The response has to comply with the generic response schema which is part of the spec
    And the response body complies with the OAS schema at "/components/schemas/BlockchainPublicAddressResponse"

  ##############################
  # Error scenarios
  ##############################

  # Error 400 scenarios

  @retrieve_blockchain_public_address_400.01_no_request_body
  Scenario: Missing request body
    Given the request body is not included
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @retrieve_blockchain_public_address_400.02_empty_request_body
  Scenario: Empty object as request body
    Given the request body is set to "{}"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @retrieve_blockchain_public_address_C02.01_phone_number_not_schema_compliant
  Scenario: Phone number value does not comply with the schema
    Given the header "Authorization" is set to a valid access which does not identify a single phone number
    And the request body property "$.phoneNumber" does not comply with the OAS schema at "/components/schemas/PhoneNumber"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  # Error 401 scenarios

  @retrieve_blockchain_public_address_401.01_no_authorization_header
  Scenario: No Authorization header
    Given the header "Authorization" is removed
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @retrieve_blockchain_public_address_401.02_expired_access_token
  Scenario: Expired access token
    Given the header "Authorization" is set to an expired access token
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then the response status code is 401
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @retrieve_blockchain_public_address_401.03_invalid_access_token
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

  @retrieve_blockchain_public_address_403.01_invalid_token_permissions
  Scenario: Inconsistent access token permissions
    # To test this, an access token has to be obtained without blockchain-public-address:read scope
    Given the request body is set to a valid request body 
    And the header "Authorization" is set to a valid access token emitted without blockchain-public-address:read scope
    When the HTTP "POST" request is sent
    Then the response status code is 403
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  # Error 404 scenarios

  @retrieve_blockchain_public_address_404.01_phone_number_not_found
  Scenario: Phone Number not found
    Given the request body property "$.phoneNumber" is set with a valid value not existing in the environment
    And the request body is set to a valid request body
    And the header "Authorization" is set to a valid access token
    When the HTTP "POST" request is sent
    Then the response status code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text

  ##############################
  ##END
  ##############################