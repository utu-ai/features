@event
Feature: cRud for an event
  on a private basis, just need to read from event

  Why:
  - UI, need to pull lists of events

  Rules:
  - ...

  Components:
    Event

    API
    v1/events/search
    v1/events/search/count

  Background:
    Given requests originate from inside the cluster

   @acceptance
   Scenario: Query events
      When request received to query event
      Then return a list of events

  @acceptance
  Scenario: Count events
     When request received to count events
     Then return count of events
