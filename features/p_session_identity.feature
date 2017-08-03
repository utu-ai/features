@identity
Feature: identity session
  for a given identity
  calculate and return a session

  Why:
  - Context.  Understanding what a given message means often must be in context of related messages.

  Rules:
  - session duration should be tunable to bot by platform

  Components:
    Identity

    API
    /v1/identity/{identityType}/{identityId}/session

  Background:
    Given requests originate from inside the cluster

  @acceptance
  Scenario: Request session
     When request received for identity session
     Then session is returned
