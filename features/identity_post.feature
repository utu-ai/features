@identity @identity_post
Feature: upsert identity
  Whenever data is received about a user
  whether from external source
  or from other internal process
  it should be upserted
  to the proper, medaled user / identity record

  Why:
  - What we know about users underpins the ability to respond to them

  Rules:
  - ...

  Components:
    Identity
    Event
    Dialog

Background:
    Given there are Identity records as follows:
    | identityKey    |
    | TIN_RECORD     |
    | BRONZE_RECORD  |
    | GOLD_RECORD    |

@acceptance
Scenario: Update received for Identity "custom" field
    When an Identity update is received for a non-matching field
    Then upsert an Identity tin record
     And push update to all medal Identity views
     And push Identity rollup to related services

Scenario Outline: Updare received for Identity "match" field
    When an Identity update is received with <matchField>
    Then review medal match when upserting an Identity tin record
     And push update to all medal Identity views
     And push impacted Identity rollup to related services

    Examples:
    | matchField    |
    | email         |
    | phone + first |
    | browserId     |
    | p + pid       |
    | foreignId     |
