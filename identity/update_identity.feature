@dialogs @receive_message
Feature: Update identity
  ...

  Why:
  - ...

  Rules:
  - ...

    Background:
        Given there are Identity records as follows:
            
             
    @acceptance 
    Scenario: Update received for non-match field
        Given 
        When an update is received for a non-matching field, like:
            | lastName | Gender | Birthday |
        Then the corresponding tin record should be updated
         And the corresponding bronze record should be updated
         And the corresponding silver record should be updated
         And the corresponding gold record should be updated

    @acceptance 
    Scenario: Update received including an email
        Given 
        When 
        Then save the message
        
    @acceptance 
    Scenario: Update received including a first name or phone
        Given 
        When 
        Then save the message

    @acceptance 
    Scenario: Update received including a foreignId
        Given 
        When 
        Then save the message

    @acceptance 
    Scenario: Update received including a browserId
        Given 
        When 
        Then save the message