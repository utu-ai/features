# header
## testing
header: {X-Consumer-Custom-Id: ordId_botId}
## testing
apiKey: {x}

# events
## private
body:
{
  botId: x
}
https://cucumber.utu.ai:5000/v1/events/search
https://cucumber.utu.ai:5000/v1/events/searchCount
## public
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
header: {X-Consumer-Custom-Id: x_x}
## private
body:
{
}
https://cucumber.utu.ai:4030/v1/identity/upsert
https://cucumber.utu.ai:4030/v1/identity/search
https://cucumber.utu.ai:4030/v1/identity/searchCount
https://cucumber.utu.ai:4030/v1/identity/find
https://cucumber.utu.ai:4030/v1/identity/session
https://cucumber.utu.ai:4030/v1/identity/updateById
## public
body:
{
  Attribute("avatar", String, func() {
		Example("http://someurl.com/image/123")
	})

	Attribute("name", String, func() {
		Example("Dr. John Henry Doe III")
	})

	Attribute("salutation", String, func() {
		Example("Dr.")
	})

	Attribute("firstName", String, func() {
		Example("John")
	})

	Attribute("middleName", String, func() {
		Example("Henry")
	})

	Attribute("lastName", String, func() {
		Example("Doe")
	})

	Attribute("suffix", String, func() {
		Example("III")
	})

	Attribute("phone", String, func() {
		Example("+1 (123) 456-7890")
	})

	Attribute("email", String, func() {
		Example("example@utu.ai")
	})

	Attribute("web", Boolean, func() {
		Example(true)
	})

	Attribute("custom", HashOf(String, Any), func() {
		Example(map[string]interface{}{
			"isSetup": true,
		})
	})
}
post identity:4020/:platform/:platformId
get identity:4020/:platform/:platformId
body:
{
  Attribute("id", String, func() {
  Example("123")
}
post identity:4020/:platform/:platformId/alias

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
