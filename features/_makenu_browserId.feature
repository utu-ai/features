@makenu 
Feature: universal browserId request
  Provide cross domain browser tracking
  store Id in utu.ai domain cookie
  retrieve or set on demand
  return Id to requestor 
  to store in local domain

  Why:
  - lets us track browsers directly and cross domain synch

  Rules:
  - ...

  Components:
    WebSDK
    Makenu

  @acceptance 
  Scenario: Request received to provide cookieId for given browser
    Given request originates from a taggable browser
     When request made for uTu.ai browserId  
     Then the browser should be tagged for the utu.ai domain
      And uTu.ai cookieId should be returned
