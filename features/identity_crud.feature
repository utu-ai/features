@identity
Feature: crud for a identity
  Identity needs to support CRUD

  Why:
  - ...

  Rules:
  - ...
  - ...

  Components:
    Identity

    API
    /v1/identity
    /v1/identity/updateById/{identityId}
    /v1/identity/{identityType}
    /v1/identity/{identityType}/count
    /v1/identity/{identityType}/{identityId}
    /v1/identity/{identityType}/{identityId}/session

  Background:
    Given requests originate from inside the cluster

  @acceptance
  Scenario: Upsert identity 
     When request received to upsert identity
     Then identity is upserted

   @acceptance
   Scenario: Request received to update identity
      When request received to update identity
      Then identity is updated

   @acceptance
   Scenario: Query identity by *
      When request received to query identity
      Then return a list of Identity
  
  @acceptance
   Scenario: identity count
      When request count of identity 
      Then return a count of Identity
      