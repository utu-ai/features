@dialogs @message
Feature: Receive message
  All messages
  should be captured in their raw form by Dialog
  and then denorm'd to all related microservices

  Rules:
  - the inbound message must containt a bot key (which kong decodes to org and botId) as well as p/pId

    Background:
        Given there are Identity records as follows:
            | Id | type    | [identityId] | orgId | botId | [{plat, pId}]    | name      | [email]        | [phone]      | [browserId] | [foreignId] | Custom.Messages |
            | 1  | tin     | 1            | 1     |   A1  | [{FB, 1234}]     | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 3               |
            | 3  | bronze  | 3, 1         | 1     |   A1  | [{FB, 1234}]     | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 3               |
            | 2  | tin     | 2            | 1     |   A1  | [{Slack, 1234}]  | Billy B   |                |              | [12345]     | [botId-CDE] | 4               |
            | 4  | bronze  | 4, 2         | 1     |   A1  | [{Slack, 1234}]  | Billy B   |                |              | [12345]     | [botId-CDE] | 4               |
          And Dialog records as follows:
            | sessionId | identityId | botId | platform | platformId | {identity}    | [{terms}]                 | messages |
            | 44        | 1          | A1    | FB       | 1234       | {Bill Bob...} | [{Order, 50}, {Pizza, 75} | 5        |
    
    @acceptance @valid_message_received
    Scenario: Received valid message for existing identity and dialog (acceptance)
        When a valid new message is received
        Then persist the message to Dialog
         And upsert denorm'd message fields to Dialog
         And record an event version of the message in Events 
         And upsert denorm'd message fields to Identity

    @acceptance @valid_message_received
    Scenario: Received valid message for new identity
       Given the identity for the message has not been previously observed
        When a valid new message like the following is received:
            | botId | platform | platformId | [{terms}]                      | message                 |
            | A3    | FB       | 4321       | [{Pizza, 75}, {Stromboli, 40}] | I'd like a piece please |
         And Identity responds with an identityId and sessionId for the message
        Then insert a new session row in Dialog
         And upsert denorm'd message fields to Dialog
         And insert an event version of the message in Events 
         And update denorm'd message fields to Identity

    @integration @valid_message_received
    Scenario: Received valid message for existing identity and dialog
        Given the new message is received within the time frame for the current session
        When a message is received as follows:
            | botId | platform | platformId | [{terms}]                      | message                 |
            | A1    | FB       | 1234       | [{Pizza, 75}, {Stromboli, 40}] | I'd like a piece please |
        Then the following record will be added to Messages:
            | sessionId | identityId | botId | platform | platformId | [{terms}]                      | message                 |
            | 44        | 1          | A1    | FB       | 1234       | [{Pizza, 75}, {Stromboli, 40}] | I'd like a piece please |
         And Dialog will be updated as follows:
            | sessionId | identityId | botId | platform | platformId | {identity}    | [{terms}]                 | messages |
            | 44        | 1          | A1    | FB       | 1234       | {Bill Bob...} | [{Order, 50}, {Pizza, 75} | 6        |
         And Identity will be updated as follows:
            | Id | type    | [identityId] | orgId | botId | [{plat, pId}]    | name      | [email]        | [phone]      | [browserId] | [foreignId] | Custom.Messages |
            | 1  | tin     | 1            | 1     |   A1  | [{FB, 1234}]     | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 4               |
            | 3  | bronze  | 3, 1         | 1     |   A1  | [{FB, 1234}]     | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 4               |
         And a new record will be inserted into Events as follows:
            | eventId | type    | identityId | botId | platform | platformId | sessionId | {identity}     | values.terms              |
            | {.*}    | Message | 1          | A1    | FB       | 1234       | 44        | {Billy Bob...} | [{Order, 50}, {Pizza, 75} |

    @integration @valid_message_received
    Scenario: Received valid message for new identity
        Given ...
        When ...
        
    @integration @valid_message_received
    Scenario: Received valid message for existing identity, but new session
        Given ...
        When ...
