@event @receive_event
Feature: new event
  All valid events
  should be captured,
  persisted,
  associated to a singular identity,
  and denormalized back to identity

  Why:
  - Events are the data that fuels our AI
  - We support an infinite range of types to try and 3-d model consumer behavior

  Rules:
  - Every event must be associated to a singular identity and session

  Components:
    Identity
    Event

  Background:
    Given there are Identity records as follows:
    | identityKey    |
    | TIN_RECORD     |
    | BRONZE_RECORD  |
    | GOLD_RECORD    |

  @acceptance @valid_event_received  @for_testing
  Scenario: Valid event received
    When a valid new Event is received
    Then save the Event
     And update Identity with Event
