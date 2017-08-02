@bot
Feature: bot API security
  Need to be able
  to retrieve and roll a bot apiKey

  Why:
  - Make it very easy to secure their data read & write

  Rules:
  - ...

  Components:
    Bot

    API
    /bots/{ownerId}/{botId}/apiKey
    /bots/{ownerId}/{botId}/apiKey/roll

  Background:
    Given requests originate from inside the cluster

  @acceptance
  Scenario: Retrive bot apiKey
      When request received for a bots apiKey
      Then return the apiKey

  @acceptance
  Scenario: Roll bot apiKey
      When request received to roll a bots apiKey
      Then return the apiKey
