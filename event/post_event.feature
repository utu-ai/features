@event @receive_event
Feature: new event
  All valid events
  should be captured, 
  persisted, 
  associated to a singular identity,
  and denormalized back to identity

  Why:
  - Events are the data that fuels our AI
  - We support an infinite range of types to try and 3-d model consumer behavior

  Rules:
  - Every event must be associated to a singular identity and session

    Background:
        Given there are Identity records as follows:
        | Id           | type    | [identityId]          | botId | custom.eventCount | custom.lastEvent | custom.LTV |
        | bot1-FB-1234 | tin     | bot1-FB-1234          | bot1  | 5                 | 7/1/17 5:00PM    | 250.75     |
        | bronze1      | bronze  | bronze1, bot1-FB-1234 | bot1  | 5                 | 7/1/17 5:00PM    | 250.75     |
        | silver1      | silver  | silver1, bot1-FB-1234 | bot1  | 5                 | 7/1/17 5:00PM    | 250.75     |
        | gold1        | gold    | gold1, bot1-FB-1234   | bot1  | 5                 | 7/1/17 5:00PM    | 250.75     |
    # could setup more complex cases here showing non singleton / merged podium records
          
          And there is an EventAlgo mapping as follows:
          | event | customVar | algo              |
          | order | LTV       | propensityToChurn |

    @acceptance @valid_event_received
    Scenario: Valid event received 
        When a valid new event is received
         And identity returns the current session
        Then save the event
         And denormalize the event to Identity
         And trigger any dependent Event models

    @integration @valid_event_received
    Scenario: Valid event received
        When a valid new event is received
         And identity returns the current session
        Then save the event
        | eventId | identityId   | sessionId | {p/pid} | type     | values.OrderTotal | values.OrderItems | Created       |
        | 1       | bot1-FB-1234 |           | FB-1234 | order    | 125.00            |  5                | 8/1/17 5:00PM |
         And denormalize the event to Identity
         | Id           | type    | [identityId]          | botId | custom.eventCount | custom.lastEvent | custom.LTV |
         | bot1-FB-1234 | tin     | bot1-FB-1234          | bot1  | 6                 | 8/1/17 5:00PM    | 375.75     |
         | bronze1      | bronze  | bronze1, bot1-FB-1234 | bot1  | 6                 | 8/1/17 5:00PM    | 375.75     |
         | silver1      | silver  | silver1, bot1-FB-1234 | bot1  | 6                 | 8/1/17 5:00PM    | 375.75     |
         | gold1        | gold    | gold1, bot1-FB-1234   | bot1  | 6                 | 8/1/17 5:00PM    | 375.75     |
         And trigger the dependent propensityToChurn model, which updates Identity
         | Id           | custom.propensityToChurn | 
         | bot1-FB-1234 | .275                     |
         | bronze1      | .275                     |
         | silver1      | .275                     | 
         | gold1        | .275                     |
