@bot
Feature: crud for a bot
  Bot needs to support CRUD

  Why:
  - Clients may have multiple personas at play in the market at any given time.

  Rules:
  - In our multitenant world, everything must have a botId.
  - ACL is managed at the bot level.

  Components:
    Bot

    API
    /bots/{ownerId}
    /bots/{ownerId}/{botId}
    /bots/{ownerId}/{botId}/apiKey
    /bots/{ownerId}/{botId}/apiKey/roll

  Background:
    Given requests originate from inside the cluster

  @acceptance
  Scenario: Request received to create new bot
     When request received to create bot
     Then bot is created

   @acceptance
   Scenario: Request received to update bot
      When request received to update bot
      Then bot is updated

   @acceptance
   Scenario: Query bots by owner
      When request received to query bot by owner
      Then return a list of bots

  @acceptance
  Scenario: Query bots by owner and bot
     When request received to query bot by owner and bot
     Then return a list of bots
  
