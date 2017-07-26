@dialogs @receive_message
Feature: Receive message
  All valid messages
  should be captured in their raw form
  persisted 
  and then denorm'd to all related services

  Rules:
  - the inbound message must containt a bot key (which kong decodes to org and botId) as well as p/pId

    Background:
        Given there are Identity records as follows:
            | Id | type    | [identityId] | orgId | botId | [{plat, pId}]    | name      | [email]        | [phone]      | [browserId] | [foreignId] | Custom.Messages |
            | 1  | tin     | 1            | 1     |   A1  | [{FB, 1234}]     | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 3               |
            | 3  | bronze  | 3, 1         | 1     |   A1  | [{FB, 1234}]     | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 3               |
            | 2  | tin     | 2            | 1     |   A1  | [{Slack, 1234}]  | Billy B   |                |              | [12345]     | [botId-CDE] | 4               |
            | 4  | bronze  | 4, 2         | 1     |   A1  | [{Slack, 1234}]  | Billy B   |                |              | [12345]     | [botId-CDE] | 4               |
          And Session records as follows:
            | sessionId | identityId | botId | stateDate        | lastDate         | 
            | 44        | 1          | A1    | 12/1/2016 5:00PM | 12/3/2016 2:00PM |
          And Dialog records as follows:
            | sessionId | identityId | botId | platform | platformId | {identity}    | [{terms}]                 | messages |
            | 44        | 1          | A1    | FB       | 1234       | {Bill Bob...} | [{Order, 50}, {Pizza, 75} | 5        |

    @acceptance @valid_message_received @existing_session
    Scenario: Received valid message for existing identity and session 
        Given the new message is received within the time frame for the current session
        When a valid new message is received
         And identity returns the current session
        Then save the message
         And update the dialog counts and terms
         And update the identity counts
         And create a summarized event 

    @integration @valid_message_received @existing_session
    Scenario: Received valid message for existing identity and session
        Given the new message is received within the time frame for the current session
        When a message is received as follows:
            | botId | platform | platformId | [{terms}]                      | message                 |
            | A1    | FB       | 1234       | [{Pizza, 75}, {Stromboli, 40}] | I'd like a piece please |
         And identity returns the current session
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

    @acceptance @valid_message_received @new_session
    Scenario: Received valid message for existing identity and new session 
        Given the new message is NOT received within the time frame for the current session
        When a valid new message is received
         And identity creates and returns a new session
        Then save the message
         And create a new dialog
         And update the identity counts
         And create a summarized event 

    @integration @valid_message_received @new_session
    Scenario: Received valid message for existing identity and new session 
        Given the new message is NOT received within the time frame for the current session
        When a message is received as follows:
            | botId | platform | platformId | [{terms}]                      | message                 |
            | A1    | FB       | 1234       | [{Pizza, 75}, {Stromboli, 40}] | I'd like a piece please |
         And identity creates and returns a new session:
            | sessionId | identityId | botId | stateDate | lastDate | 
            | 45        | 1          | A1    | TIMEDATE  | LASTDATE |
        Then the following record will be added to Messages:
            | sessionId | identityId | botId | platform | platformId | [{terms}]                      | message                 |
            | 45        | 1          | A1    | FB       | 1234       | [{Pizza, 75}, {Stromboli, 40}] | I'd like a piece please |
         And a new Dialog will be created as follows:
            | sessionId | identityId | botId | platform | platformId | {identity}    | [{terms}]                 | messages |
            | 45        | 1          | A1    | FB       | 1234       | {Bill Bob...} | [{Order, 50}, {Pizza, 75} | 1        |
         And Identity will be updated as follows:
            | Id | type    | [identityId] | orgId | botId | [{plat, pId}]    | name      | [email]        | [phone]      | [browserId] | [foreignId] | Custom.Messages |
            | 1  | tin     | 1            | 1     |   A1  | [{FB, 1234}]     | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 4               |
            | 3  | bronze  | 3, 1         | 1     |   A1  | [{FB, 1234}]     | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 4               |
         And a new record will be inserted into Events as follows:
            | eventId | type    | identityId | botId | platform | platformId | sessionId | {identity}     | values.terms              |
            | {.*}    | Message | 1          | A1    | FB       | 1234       | 44        | {Billy Bob...} | [{Order, 50}, {Pizza, 75} |

    @acceptance @valid_message_received @new_identity
    Scenario: Received valid message for NEW identity and new session 
        When a valid new message is received
         And identity creates and returns a new identity 
         And returns a new session
        Then save the message
         And create a new dialog
         And update the identity counts
         And create a summarized event 

    @integration @valid_message_received @new_identity
    Scenario: Received valid message for existing identity and new session 
        Given the new message is NOT received within the time frame for the current session
        When a message is received as follows:
            | botId | platform | platformId | [{terms}]                      | message                 |
            | A1    | FB       | 1234Z      | [{Pizza, 50}, {Stromboli, 50}] | I'd like a piece please |
         And identity creates and returns a new identity:
            | Id | type    | [identityId] | orgId | botId | [{plat, pId}]    | name      | [email]        | [phone]      | [browserId] | [foreignId] | Custom.Messages |
            | 5  | tin     | 5            | 1     |   A1  | [{FB, 1234Z}]    | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 4               |
            | 6  | bronze  | 6, 5         | 1     |   A1  | [{FB, 1234Z}]    | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 4               |
         And identity creates and returns a new session:
            | sessionId | identityId | botId | stateDate | lastDate | 
            | 45        | 1          | A1    | TIMEDATE  | LASTDATE |
        Then the following record will be added to Messages:
            | sessionId | identityId | botId | platform | platformId | [{terms}]                      | message                 |
            | 45        | 1          | A1    | FB       | 1234       | [{Pizza, 75}, {Stromboli, 40}] | I'd like a piece please |
         And a new Dialog will be created as follows:
            | sessionId | identityId | botId | platform | platformId | {identity}    | [{terms}]                 | messages |
            | 45        | 1          | A1    | FB       | 1234       | {Bill Bob...} | [{Order, 50}, {Pizza, 75} | 1        |
         And Identity will be updated as follows:
            | Id | type    | [identityId] | orgId | botId | [{plat, pId}]    | name      | [email]        | [phone]      | [browserId] | [foreignId] | Custom.Messages |
            | 1  | tin     | 1            | 1     |   A1  | [{FB, 1234}]     | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 4               |
            | 3  | bronze  | 3, 1         | 1     |   A1  | [{FB, 1234}]     | Billy Bob | bbob@gmail.com | 312.312.3124 | [1234]      | [botId-ABC] | 4               |
         And a new record will be inserted into Events as follows:
            | eventId | type    | identityId | botId | platform | platformId | sessionId | {identity}     | values.terms              |
            | {.*}    | Message | 1          | A1    | FB       | 1234       | 44        | {Billy Bob...} | [{Order, 50}, {Pizza, 75} |
