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
Scenario Outline: Updare received for Identity "match" field
    Given request contains botKey with right access level
     When an Identity search request by <matchField> for <medal> type is received
     Then return the requested Identity record(s) or an appropriate response

    Examples:
    | matchField    | medal  |
    | tinId         | tin    |
    | email         | bronze |
    | browserId     | silver |
    | p + pid       | gold   |
    | foreignId     |
    | phone         |
