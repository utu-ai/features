@makenu 
Feature: universal browserId request
  Provide cross domain browser tracking
  store Id in utu.ai domain cookie
  retrieve or set on demand
  return Id to requestor 
  to store in local domain

  Why:
  - ...

  Rules:
  - ...

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
