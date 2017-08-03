@dialog
Feature: cRud for a dialog
  on a private basis, just need to read from dialog

  Why:
  - UI, need to pull lists of dialogs

  Rules:
  - ...

  Components:
    Event

    API
    v1/dialog/search
    v1/dialog/search/count

  Background:
    Given requests originate from inside the cluster

  #update occurs when identity is denorm'd to dialog e.g.,
  @acceptance
  Scenario: Update dialog
    When update received for a dialog
    Then update the dialog

  @acceptance
  Scenario: Query dialog
    When request received to query dialog
    Then return a list of dialogs

@acceptance
Scenario: Count dialog
    When request received to count dialogs
    Then return a count of dialogs
