@dialog @receive_message
Feature: new message
  All valid messages
  should be captured in their raw form
  persisted
  and then denorm'd to all related services

  Why:
  - we can run sentiment models on user's text to evaluate their state of mind
  - in the future, we will likely get in the intent business ourselves.  having the raw data will be useful.
  - in any consumer analytics environment, hold on to ALL the data you can, for as LONG as you can.

  Rules:
  - the inbound message must containt a bot key (which kong decodes to org and botId) as well as p/pId

    Background:
        Given the following identity records:
          [db.getIdentity(Tin)]
          And Session records:
          [db.getSession(Tin)]
          And Dialog records as follows:
          [db.getDialog(Tin)]

    @acceptance @valid_message_received
    Scenario: Received valid message
        When a valid new message is received for an existing user
        Then save the message
         And update dialog
         And update identity
         And create a summarized event

# Do we need from ehre down?

    @acceptance @valid_message_received @existing_session
    Scenario: Received valid message for existing identity and session
        When a valid new message is received for an existing user
        Then save the message
         And update dialog
         And update identity
         And create a summarized event

    @acceptance @valid_message_received @new_session
    Scenario: Received valid message for existing identity and new session
        Given the new message is NOT received within the time frame for the current session
        When a valid new message is received
         And identity creates and returns a new session
        Then save the message
         And create a new dialog
         And update the identity counts
         And create a summarized event


    @acceptance @valid_message_received @new_identity
    Scenario: Received valid message for NEW identity and new session
        When a valid new message is received
         And identity creates and returns a new identity
         And returns a new session
        Then save the message
         And create a new dialog
         And update the identity counts
         And create a summarized event
