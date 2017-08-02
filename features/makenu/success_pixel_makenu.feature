@makenu 
Feature: success pixel tracker 
  provide a success pixel to clients
  for conversion tracking
  on target sites or pages

  Why:
  - verify that a desired action took place post the dialog

  Rules:
  - ...

  Components:
    Makenu

  @acceptance 
  Scenario: success pixel click
    Given the uTu success pixel has been deployed on a client site
     When the success pixel is clicked
     Then the browser should be tagged for the utu.ai domain
