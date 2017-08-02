@makenu 
Feature: conversant link tracker 
  any link we present via a dialog
  we will shorten the link
  proxy any clicks that it gets
  and cookie the browser 

  Why:
  - this is one way we can match a conversant key to a digital one
  - enables us to show digital behavior tied to a click

  Rules:
  - ...

  Components:
    Identity
    Makenu

  @acceptance 
  Scenario: NOT first click
     When the dialog link is clicked
     Then the browser should be tagged for the utu.ai domain

  @acceptance 
  Scenario: First click alias
    Given dialog rendered link has NOT been clicked
      And there is only one participant in the dialog
     When the dialog link is clicked
     Then the browser should be tagged for the utu.ai domain
      And the browserId should be aliased to the dialog identity
