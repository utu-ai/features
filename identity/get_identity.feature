@identity @identity_get
Feature: Search identity
  ...

  Why:
  - Both internal and external systems can benefit from the medaled identity views we've stitched and enhanced

  Rules:
  - ...

    Background:
        Given there are Identity records as follows:
    all requests are scoped to a specific botId

    # these are probably a REALLY good example as when to use examples?             
    @acceptance 
    Scenario: Request for identity by tinId
        Given 
        When 
        Then 

    @acceptance 
    Scenario: Request for identity by bot+p+pid
        Given 
        When 
        Then 

    @acceptance 
    Scenario: Request for identity by email
        Given 
        When 
        Then 
        
    @acceptance 
    Scenario: Request for identity by browserId
        Given 
        When 
        Then 
    