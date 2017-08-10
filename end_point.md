# header
## testing
header: {X-Consumer-Custom-Id: ordId_botId}
## prod
apiKey: {x}

# events
## private
parameter: ?botId=xxxx
body:
{
}
https://cucumber.utu.ai:5000/v1/events/search
https://cucumber.utu.ai:5000/v1/events/searchCount
## public
header: {X-Consumer-Custom-Id: x_x}
body:
{
  "platform": "sms",
  "platformId": "123-123-1234",
  "event": "test sms event",
  "values": {
    "var1":"foo",
    "var2":"bar"
  }
}
https://cucumber.utu.ai:4090/v1/track

# identity
## private
parameter
body:
{
}
https://cucumber.utu.ai:4030/v1/identity/
https://cucumber.utu.ai:4030/v1/identity/updateById/:indentityId
https://cucumber.utu.ai:4030/v1/identity/{identityType}
https://cucumber.utu.ai:4030/v1/identity/{identityType}/count
https://cucumber.utu.ai:4030/v1/identity/{identityType}/:identityId
https://cucumber.utu.ai:4030/v1/identity/{identityType}/:identityId/session
## public
header: {X-Consumer-Custom-Id: x_x}
parameters: ?platform:xxxx;platformId:xxxx
post identity:4020/:platform/:platformId
body:
{
  avatar: "http://someurl.com/image/123"
  name "Dr. John Henry Doe III"
	phone "+1 (123) 456-7890"
	email "example@utu.ai"
}
get identity:4020/:platform/:platformId
body:
{}
post identity:4020/:platform/:platformId/alias
body:
{
  id: "123"
}

# dialog
## private
## public

# makenu
## private
:4010
https://cucumber.utu.ai:4010/v1/browser-id
https://cucumber.utu.ai:4010/v1/:id
https://cucumber.utu.ai:4010/v1/pixel
## public
:4000
https://cucumber.utu.ai:4000/v1/generate-urls

# bot
## private
## public
bot 5020

# cyrano
## private
## public
cyrano 4070
