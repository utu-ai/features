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

    Background:
        Given there are Identity records as follows:
          [db.getIdentity(Tin)]
          And there is an EventAlgo mapping as follows:
          [db.getIdentity(Tin)]

    @acceptance @valid_event_received
    Scenario: Valid event received 
        When a valid new event is received
        Then save the event
         And update Identity
