<a href="https://github.com/camaraproject/BlockchainPublicAddresscommits/" title="Last Commit"><img src="https://img.shields.io/github/last-commit/camaraproject/BlockchainPublicAddress?style=plastic"></a>
<a href="https://github.com/camaraproject/BlockchainPublicAddress/issues" title="Open Issues"><img src="https://img.shields.io/github/issues/camaraproject/BlockchainPublicAddress?style=plastic"></a>
<a href="https://github.com/camaraproject/BlockchainPublicAddress/pulls" title="Open Pull Requests"><img src="https://img.shields.io/github/issues-pr/camaraproject/BlockchainPublicAddress?style=plastic"></a>
<a href="https://github.com/camaraproject/BlockchainPublicAddress/graphs/contributors" title="Contributors"><img src="https://img.shields.io/github/contributors/camaraproject/BlockchainPublicAddress?style=plastic"></a>
<a href="https://github.com/camaraproject/BlockchainPublicAddress" title="Repo Size"><img src="https://img.shields.io/github/repo-size/camaraproject/BlockchainPublicAddress?style=plastic"></a>
<a href="https://github.com/camaraproject/BlockchainPublicAddress/blob/main/LICENSE" title="License"><img src="https://img.shields.io/badge/License-Apache%202.0-green.svg?style=plastic"></a>
<a href="https://github.com/camaraproject/BlockchainPublicAddress/releases/latest" title="Latest Release"><img src="https://img.shields.io/github/release/camaraproject/BlockchainPublicAddress?style=plastic"></a>
<a href="https://github.com/camaraproject/Governance/blob/main/ProjectStructureAndRoles.md" title="Sandbox API Repository"><img src="https://img.shields.io/badge/Sandbox%20API%20Repository-yellow?style=plastic"></a>

# BlockchainPublicAddress

Sandbox API Repository to describe, develop, document, and test the BlockchainPublicAddress Service API(s). The repository does not yet belong to a CAMARA Sub Project.

* API Repository [wiki page](https://lf-camaraproject.atlassian.net/wiki/x/KDHe)

## Scope
* Service APIs for “Blockchain Public Address” (see APIBacklog.md)
* It provides the API consumer with the ability to:
  * Blockchain Public Address API:
    * Manage a Blockchain Public Address associated to a phone number, i.e. to retrieve the blockchain public address(es) and to bind/unbind a Blockchain Public Address. The Blockchain Public Address is utilized as Decentralized Identifier (DID). With the proposed API, API providers offer API consumers the following capability: pairing phone number with Blockchain Public Address whenever this 3rd party wants to offer its customers a way to make transactions more easily based on the phone number instead of the Blockchain Public Address.
    * Optional binding enforcement procedure, ensuring both `phoneNumber` and `blockchainPublicAddress` belongs to the same owner (i.e. person), within binding process by means of the checking of provided `nonce` and `signature` fields. To generate `nonce` below mentioned Blockchain Public Address Validation API has been designed, and `signature` generation is an off-chain process.
  * Blockchain Public Address Validation API:
    * Manage generation of a nonce (one-time challenge) to be used in binding enforcemnet procedure.
* Describe, develop, document and test the APIs (with 1-2 Telcos)  
* Started: June 2023

## Release Information
* Note: Please be aware that the project will have updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until a new release is created. For example, changes may be reverted before a release is created. **For best results, use the latest available release**.

* **The pre-release [r2.1 - rc](https://github.com/camaraproject/BlockchainPublicAddress/releases/tag/r2.1) for the Blockchain Public Address APIs is available.**
<br>This is a release candidate. Until the public release there are bug fixes to be expected. The release candidate is suitable for implementors, but it is not recommended to use the APIs with customers in productive environments.

* This pre-release includes the following APIs:
- API name: Blockchain Public Address - API Definition v0.3.0-rc.1 with inline documentation:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r2.1/code/API_definitions/blockchain-public-address.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r2.1/code/API_definitions/blockchain-public-address.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/BlockchainPublicAddress/blob/r2.1/code/API_definitions/blockchain-public-address.yaml)

- API name: Blockchain Public Address Validation - API Definition v0.1.0-rc.1 with inline documentation:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r2.1/code/API_definitions/blockchain-public-address-validation.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/BlockchainPublicAddress/r2.1/code/API_definitions/blockchain-public-address-validation.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/BlockchainPublicAddress/blob/r2.1/code/API_definitions/blockchain-public-address-validation.yaml)

* Other releases of this sub project are available in [BlockchainPublicAddress Releases](https://github.com/camaraproject/BlockchainPublicAddress/releases)
* For changes see [CHANGELOG.md](/CHANGELOG.md)

## Contributing
* Meetings
    * [Registration/Join](https://zoom-lfx.platform.linuxfoundation.org/meeting/99023344259?password=cb995600-56ee-48a2-ade1-607bb10487df)
    * Schedule: Bi-weekly on Thursdays, 13:00-14:00 CET/CEST (12:00 UTC, 11:00 UTC during European DST)
    * Minutes: Access [meeting minutes](https://lf-camaraproject.atlassian.net/wiki/x/thDe).
* Mailing List
    * Subscribe / Unsubscribe to the mailing list of this Sub Project <https://lists.camaraproject.org/g/sp-bpa>.
    * A message to the community of this Sub Project can be sent using <sp-bpa@lists.camaraproject.org>.
