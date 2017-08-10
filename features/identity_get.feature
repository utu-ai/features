@identity @identity_get
Feature: Search identity
  With proper credentials
  return the proper view of an identity
  scoped to tin, bronze, gold, or silver

  Why:
  - tons of applications of how we could externalize what we know about an identity for 3rd party services

  Rules:
  - need to be very locked down to make sure we only give access to proper requests.  Fatal place for leaks.

  Components:
    Identity

Background:
    Given there are Identity records as follows:
    | identityKey    |
    | TIN_RECORD     |
    | BRONZE_RECORD  |
    | GOLD_RECORD    |

@acceptance
Scenario: Updare received for Identity "match" field
    Given request contains botKey with right access level
     When an Identity search request by "tinId" for "tin" type is received
     Then return the requested Identity record(s) or an appropriate response

	 @acceptance
Scenario: Updare received for Identity "match" field
    Given request contains botKey with right access level
     When an Identity search request by "email" for "bronze" type is received
     Then return the requested Identity record(s) or an appropriate response

	 @acceptance
Scenario: Updare received for Identity "match" field
    Given request contains botKey with right access level
     When an Identity search request by "browserId" for "silver" type is received
     Then return the requested Identity record(s) or an appropriate response

	 @acceptance
Scenario: Updare received for Identity "match" field
    Given request contains botKey with right access level
     When an Identity search request by "p + pid" for "gold" type is received
     Then return the requested Identity record(s) or an appropriate response
