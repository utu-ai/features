@bot
Feature: cRud for an bot
  on a private basis, just need to read from bot

  Why:
  - UI, need to pull lists of bots

  Rules:
  - ...

  Components:
    Bot

    API
    v1/bot/search
    v1/bot/search/count

  Background:
    Given requests originate from inside the cluster

   @acceptance
   Scenario: Query bots
      When request received to query bot by owner
      Then return a list of bots

  @acceptance
  Scenario: Count bots
     When request received to query bot by owner and bot
     Then return a list of bots
  
