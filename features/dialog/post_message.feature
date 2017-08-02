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

  Components:
    Dialog
    Identity
    Event

  Background:
    Given there are Identity records as follows:
    | identityKey    |
    | TIN_RECORD     |
    | BRONZE_RECORD  |
    | GOLD_RECORD    |
      And there are Dialog records as follows:
      | dialogKey     |
      | DIALOG_RECORD |

  @acceptance @valid_message_received
  Scenario: Received valid message from existing user for active dialog
    When a valid new message is received for an existing user who is actively dialoging
    Then save the Message
     And update Dialog with Message
     And update Identity with Message
     And create a summarized Event for Message

  @acceptance @valid_message_received
  Scenario: Received valid message from existing user for new dialog
    When a valid new message is received for an existing user starting a new dialog
    Then save the Message
      And update Dialog with Message
      And update Identity with Message
      And create a summarized Event for Message

  @acceptance @valid_message_received
  Scenario: Received valid message from new user
    When a valid new message is received from a new user
    Then save the Message
      And update Dialog with Message
      And update Identity with Message
      And create a summarized Event for Message
