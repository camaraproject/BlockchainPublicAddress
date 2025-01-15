# Changelog BlockchainPublicAddress

## Table of Contents

- [r2.1 - rc](#r11---rc)
- [v0.1.0](#v010)

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for each first alpha or release-candidate API version, all changes since the release of the previous public API version
* for subsequent alpha or release-candidate API versions, the delta with respect to the previous pre-release
* for a public API version, the consolidated changes since the release of the previous public API version

## r1.1 - rc

## Release Notes

This release contains the definition and documentation of
* Blockchain Public Address v0.2.0-rc.1

The API definition(s) are based on
* Commonalities v0.5.0-alpha.1
* Identity and Consent Management v0.3.0-alpha.1

## Blockchain Public Address v0.2.0-rc.1

**Blockchain Public Address v0.2.0-rc.1 is the first release-candidate version for v0.2.0 of the Blockchain Public Address API.**
- **This version contains significant changes compared to v0.1.0, and it is not backward compatible:**
  - Refactor `retrieveBlockchainPublicAddress` endpoint to use an HTTP POST request
  - Error model aligment with commonalities, which implies use of normalization values (i.e. enums) for `status` and `code`
  - Removal of `5XX` errors


- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r1.1/code/API_definitions/blockchain-public-address.yaml&nocors)
  - [View it on Swagger Editor](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r1.1/code/API_definitions/blockchain-public-address.yaml)
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


**Full Changelog**: https://github.com/camaraproject/CarrierBillingCheckOut/compare/v0.1.0...r1.1

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
