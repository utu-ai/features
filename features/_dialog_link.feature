@makenu
Feature: makenu link generator
  any link to be dropped in a dialog
  shorten it and proxy it

  Why:
  - want to track everything we can coming or going from a dialog

  Rules:
  - ...

  Components:
    Makenu

    API
    /v1/generate-urls

  Background:
    Given requests originate from inside the cluster

  @acceptance
  Scenario: posting link to dialog
     When a link is to be posted in a dialog
     Then the link should be shortened and proxied
