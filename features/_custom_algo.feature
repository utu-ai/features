@event @custom_algo
Feature: event triggers custom algo
  Every time an event is added
  check if there if a custom algo
  has been mapped to a mutated fieldz

  Why:
  - Modeling data can unleash its true potential
  - Reacting to data mutations in realtime creates numerous applications

  Rules:
  - Every event must be associated to a singular identity and session

  Components:
    Identity
    Event

  Background:
    Given there are EventAlgo mappings as follows:
    | eventAlgoKey |
    | ALGO_MAP_REC |

  @acceptance @custom_algo
  Scenario: Event field mutation triggers custom algo to run
    When an Event of type "Order" containing an "orderValue" is received
    Then the associated Algo should fire
