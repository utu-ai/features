Feature: Record message
  Any text based written word
  whether dialog message, email, social media post, crm notes, V2T transcript, etc.
  along w/ any supporting meta data (e.g., keywords, intents, message structure, etc.)
  should be attributed to a user, channel, and session
  and recorded

  Scenario: Message from FB Messenger
    Given the proper endpoint - https://utu.ai/v1/event
    And the message is signed w/ an authentic bot key
    And the message contains a platform (uTu.constant) and platformId for the speaker
    When the message is received 
    And Kong decodes the bot key to a bot and organization Id
    Then Dialog should call Identity w/ the botId, platform, and platformId and 
        receive back an IdentityId, SessionId, and denormed {Identity} 
    Then Dialog should persist this message, inserting a new row in Message that 
        contains sessionId, identityId, {Identity}, botId, platform, platformId, 
        [{terms}] (an NLP interpreted and supplied list of key words),
        rawMessage (the full JSON / HTML structure of the FB Messenger message - so we 
          can recreate it faithfully in our UI)
        and message (the extracted text only portion of the message)
    Then Dialog should denorm the message to the dialog summary.  It should upsert
        a row for the sessionId.  Fields should include identityId, botId, platform, 
        platformId, the [{terms}], and increment the messagesCount
    And Dialog should denorm to Events.  This should create a new event of type "messaage",
        with identityId, sessionId, platform, platformId, botId, and {custom} that contains
        the [{terms}]
    Then Dialog should denorm the dialog summary to identity.  For the identityId, this 
        should update the dialogCount and messageCount (in turn this should trigger
        the identity medaling logic).
