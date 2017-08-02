@identity @identity_post
Feature: alias identity
  One off condition.  Used when a known foreignId wants to be applied
  directly against a known tin (a.k.a. identityId).

  Why:
  - Cross linking match keys is one of the most important things we can do.
  
  Rules:
  - ...

Background:
    Given there are Identity records as follows:
    | identityKey    |
    | TIN_RECORD     |
    | BRONZE_RECORD  |
    | GOLD_RECORD    |
                     
@acceptance
Scenario: Alias called for a known identity
    When an aliased foreignId is received 
    Then review medal match when upserting an Identity tin record
     And push update to all medal Identity views
     And push impacted Identity rollup to related services
