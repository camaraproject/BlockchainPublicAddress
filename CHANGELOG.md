# Changelog BlockchainPublicAddress

## Table of Contents

- [2.1 - rc](#r21---rc)
- [r1.2](#r12)
- [r1.1 - rc](#r11---rc)
- [v0.1.0](#v010)

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

## r2.1 - rc

## Release Notes

This release contains the definition and documentation of
* Blockchain Public Address v0.3.0-rc.1
* Blockchain Public Address Validation v0.1.0-rc.1

The API definition(s) are based on
* Commonalities v0.6.0-rc.1
* Identity and Consent Management v0.4.0-rc.1

## Blockchain Public Address v0.3.0-rc.1

**Blockchain Public Address v0.3.0-rc.1 is the first release-candidate version for v0.3.0 of the Blockchain Public Address API.**
- **This version contains changes compared to v0.2.0, and it is not backward compatible:**
  - Removal of `401 - AUTHENTICATION_REQUIRED`
  - New pattern for `x-correlator`
  - Addition of a new section `# Additional CAMARA error responses` in `info.description` field
  - Addition of `422 - BLOCKCHAIN_PUBLIC_ADDRESS.UNSUPPORTED_ENHANCED_VALIDATION`
  - Addition of `400 - BLOCKCHAIN_PUBLIC_ADDRESS.INVALID_NONCE`
  - Addition of `400 - BLOCKCHAIN_PUBLIC_ADDRESS.INVALID_SIGNATURE`
  - Addition of `400 - BLOCKCHAIN_PUBLIC_ADDRESS.BOTH_NONCE_SIGNATURE_REQUIRED`


- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r2.1/code/API_definitions/blockchain-public-address.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r2.1/code/API_definitions/blockchain-public-address.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/BlockchainPublicAddress/blob/r2.1/code/API_definitions/blockchain-public-address.yaml)

**Main changes since [r1.2](#r12)**

### Added
* Binding enforcement procedure, including addition of new errors `422 - BLOCKCHAIN_PUBLIC_ADDRESS.UNSUPPORTED_ENHANCED_VALIDATION`, `400 - BLOCKCHAIN_PUBLIC_ADDRESS.INVALID_NONCE`, `400 - BLOCKCHAIN_PUBLIC_ADDRESS.INVALID_SIGNATURE` and `400 - BLOCKCHAIN_PUBLIC_ADDRESS.BOTH_NONCE_SIGNATURE_REQUIRED` in https://github.com/camaraproject/BlockchainPublicAddress/pull/76, https://github.com/camaraproject/BlockchainPublicAddress/pull/95 and https://github.com/camaraproject/BlockchainPublicAddress/pull/97.
* New section `# Additional CAMARA error responses` in `info.description` field in https://github.com/camaraproject/BlockchainPublicAddress/pull/99.

### Changed
* New pattern for `x-correlator` and model aligment with Commonalities in https://github.com/camaraproject/BlockchainPublicAddress/pull/99.
* Update User Stories adding a new user story for Binding Enforcement and making some wording alignment in https://github.com/camaraproject/BlockchainPublicAddress/pull/100.
* Update Gherkin feature files, adding a new test for testing invalid x-correlator value in all API endpoints, adding a specific test to check binding enforcement in `bindBlockchainPublicAddress` endpoint and making some wording alignments with Commonalities in https://github.com/camaraproject/BlockchainPublicAddress/pull/101.

### Fixed
* N/A

### Removed
* `401 - AUTHENTICATION_REQUIRED` error in https://github.com/camaraproject/BlockchainPublicAddress/pull/99.

## New Contributors
* N/A

## Blockchain Public Address Validation v0.1.0-rc.1

**Blockchain Public Address Validation v0.1.0-rc.1 is the first release-candidate version for v0.1.0 of the Blockchain Public Address Validation API.**
- **This version defines a new API:**
  - Initial version covering the following functionality and related endpoints:
    - New endpoint `createBlockchainPublicAddressValidationNonce`, to generate a nonce (one-time challenge) in order to be able to perform binding enforcement in binding process defined in Blockchain Public Address API.


- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r2.1/code/API_definitions/blockchain-public-address-validation.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r2.1/code/API_definitions/blockchain-public-address-validation.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/BlockchainPublicAddress/blob/r2.1/code/API_definitions/blockchain-public-address-validation.yaml)

### Added
* Baseline API specification definition in https://github.com/camaraproject/BlockchainPublicAddress/pull/76.
* New section `# Additional CAMARA error responses` in `info.description` field in https://github.com/camaraproject/BlockchainPublicAddress/pull/102.

### Changed
* New pattern for `x-correlator` and model aligment with Commonalities in https://github.com/camaraproject/BlockchainPublicAddress/pull/102.
* Generate User Stories in https://github.com/camaraproject/BlockchainPublicAddress/pull/103.
* Generate Gherkin feature file, aligned with Commonalities in https://github.com/camaraproject/BlockchainPublicAddress/pull/104.

### Fixed
* N/A

### Removed
* `401 - AUTHENTICATION_REQUIRED` error in https://github.com/camaraproject/BlockchainPublicAddress/pull/102.

## New Contributors
* N/A


**Full Changelog**: https://github.com/camaraproject/BlockchainPublicAddress/compare/r1.2...r2.1

## r1.2

## Release Notes

This release contains the definition and documentation of
* Blockchain Public Address v0.2.0

The API definition(s) are based on
* Commonalities v0.5.0
* Identity and Consent Management v0.3.0

## Blockchain Public Address v0.2.0

**Blockchain Public Address v0.2.0 is the first public release version for v0.2.0 of the Blockchain Public Address API.**
- **This version contains significant changes compared to v0.1.0, and it is not backward compatible:**
  - Refactor `retrieveBlockchainPublicAddress` endpoint to use an HTTP POST request
  - Error model aligment with commonalities, which implies use of normalization values (i.e. enums) for `status` and `code`
  - Removal of `5XX` errors


- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r1.2/code/API_definitions/blockchain-public-address.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r1.2/code/API_definitions/blockchain-public-address.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/BlockchainPublicAddress/blob/r1.2/code/API_definitions/blockchain-public-address.yaml)

**Main changes since [r1.1 - rc](#r11---rc)**

### Added
* N/A

### Changed
* Adapt API specification version and servers.url for public release in https://github.com/camaraproject/BlockchainPublicAddress/pull/74.
* Adapt Testing version for public release in https://github.com/camaraproject/BlockchainPublicAddress/pull/74.

### Fixed
* N/A

### Removed
* N/A

## New Contributors
* N/A


**Full Changelog**: https://github.com/camaraproject/BlockchainPublicAddress/compare/v0.1.0...r1.2

## r1.1 - rc

## Release Notes

This release contains the definition and documentation of
* Blockchain Public Address v0.2.0-rc.1

The API definition(s) are based on
* Commonalities v0.5.0-rc.1
* Identity and Consent Management v0.3.0-rc.1

## Blockchain Public Address v0.2.0-rc.1

**Blockchain Public Address v0.2.0-rc.1 is the first release-candidate version for v0.2.0 of the Blockchain Public Address API.**
- **This version contains significant changes compared to v0.1.0, and it is not backward compatible:**
  - Refactor `retrieveBlockchainPublicAddress` endpoint to use an HTTP POST request
  - Error model aligment with commonalities, which implies use of normalization values (i.e. enums) for `status` and `code`
  - Removal of `5XX` errors


- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r1.1/code/API_definitions/blockchain-public-address.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r1.1/code/API_definitions/blockchain-public-address.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/BlockchainPublicAddress/blob/r1.1/code/API_definitions/blockchain-public-address.yaml)

### Added
* Added new `blockChainNetworkId` Aleph Zero Network in https://github.com/camaraproject/BlockchainPublicAddress/pull/60.
* Added API Readiness Checklist in https://github.com/camaraproject/BlockchainPublicAddress/pull/68.
* Added initial testing plan in https://github.com/camaraproject/BlockchainPublicAddress/pull/70.

### Changed
* API aligment with Commonalities (Fall24 aligment) in https://github.com/camaraproject/BlockchainPublicAddress/pull/58.
* Refactor `retrieveBlockchainPublicAddress` endpoint to use an HTTP POST request (avoid phoneNumber as query param) in https://github.com/camaraproject/BlockchainPublicAddress/pull/60.
* Updated User Story file name in https://github.com/camaraproject/BlockchainPublicAddress/pull/67.
* Updated `# Authorization and authentication` section from ICM guideline in https://github.com/camaraproject/BlockchainPublicAddress/pull/69.
* Error model aligment with commonalities (Spring25 aligment). Normalization values (i.e. enums) for `status` and `code`. In https://github.com/camaraproject/BlockchainPublicAddress/pull/69.

### Fixed
* Phone number description to be aligned with Commonalities in https://github.com/camaraproject/BlockchainPublicAddress/pull/69.

### Removed
* Removed `5XX` errors in https://github.com/camaraproject/BlockchainPublicAddress/pull/69.

## New Contributors
* N/A


**Full Changelog**: https://github.com/camaraproject/BlockchainPublicAddress/compare/v0.1.0...r1.1

## 0.1.0

## Release Notes

**Initial baseline contribution**
- API [definition](https://github.com/camaraproject/BlockchainPublicAddress/tree/release-0.1.0/code/API_definitions)


## Please note 
- this "release" is tagged to have an initial baseline API contribution to move forward. It is released for early implementations.
- there are ongoing discussions so API evolution is expected.

### Added
* Initial version with three endpoints:
  * New endpoint `retrieveBlockchainPublicAddress`
  * New endpoint `bindBlockchainPublicAddress`
  * New endpoint `deleteBlockchainPublicAddress`

### Changed
* N/A

### Fixed
* N/A

### Removed
* N/A

## New Contributors
* N/A


**Full Changelog**: https://github.com/camaraproject/BlockchainPublicAddress/commits/v0.1.0
