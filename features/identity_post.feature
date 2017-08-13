@identity @identity_post @e2e
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

#Non-Matching Scenarios
Scenario: unmatchable update received for existing identity
   Given a number of related, but unmatched identity records exist
    When an unmatchable update is received for that identity
    Then upsert identity

@for_testing_1
Scenario: unmatchable update received for new identity
   Given no records exist that match the new identity
    When an unmatchable update is received for that identity
    Then upsert identity

#Matching Scenarios
Scenario: matchable update received for existing identity
   Given there is a number of related, but unmatched identity records
     And existing identity records have associated events 
    When a matchable update is received for that identity
    Then upsert identity

Scenario: matchable update received for existing identity
   Given no records exist that match the new identity
    When a matchable update is received for that identity
    Then upsert identity
