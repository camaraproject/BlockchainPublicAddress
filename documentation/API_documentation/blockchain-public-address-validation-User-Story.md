# BlockchainPublicAddress Validation API User Stories

|  **Item**  |  **Details**  |
| ---------- | ------------- |
|  **US#1**  | User Story #1 |
| ***Summary*** | As an application developer, I want a feature to generate a nonce (one-time challenge) associated to a blockchain public address, in order for the customer to be able to sign it off-chain, generating a signature. This will allow afterwards to perform binding enforment via Blockchain Public Address binding process. |
| ***Roles, Actors and Scope*** | **Roles:** Customer:User<br> **Actors:** Application service providers, hyperscalers, application developers.<br> **Scope:** Obtain a nonce associated to a blockchainPublicAdress of the Customer |
| ***Pre-conditions*** | N/A |
| ***Activities/Steps*** | **Starts when:** The API Consumer makes a POST request to the Blockchain Public Address Validation API to obtain a nonce associated to a blockchainPublicAdress (indicated as an input) of the Customer.<br>**Ends when:** The API Consumer receives POST response with the nonce value. |
| ***Post-conditions*** | N/A |
| ***Exceptions*** | Several exceptions might occur during the nonce generation<br>- Unauthorized: Not valid credentials (e.g. use of already expired access token).<br>- Invalid Argument: Not valid blockchainPublicAddress.<br>- Internal: Server Error when fetching information. |
