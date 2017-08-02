'use strict';

    var expect = require('chai').expect;
    var identifier = null;
    var helloWorld = require("../../hello_world");
    var restFactory = require('../../rest_factory');
// Public Api:
// https://api.utu.ai/v1/track
// header:
//     apiKey: 'xxxxx'
// body:
// {
//     "platform": "sms",
//     "platformId": "123-123-1234",
//     "event": "test sms evet",
//     "values": {
//     "var1":"foo",
//     "var2":"bar"
//     }
// }

module.exports = function() {

    this.Given(/^there are Identity records as follows:$/, function (table) {
        checkWhetherRecordsPresent();
    });

    var checkWhetherRecordsPresent = function(){
        // Call the mongoDB and check whether the table contents are present in the database MongoDB utility
        // If not, insert the contents into the database
        // then validate true to complete this step.
        this.restFactory.message('Rajesh');
    };

    this.When(/^a valid new Event is received$/, function (callback) {
        this.helloWorld.message('Rajesh');
        var apiKey = "0475dbadc4cb410bbf562d605ea2cd47";
        var context = {          
            platform: "sms",
            platformId: "123-123-1234",
            event: "test sms evet",
            values: {
                var1: "foo",
                var2: "bar"
            }
        };

        restFactory.post(
            "/track",
            apiKey,
            JSON.stringify(context),
            callback()
        );
    });

    this.Then(/^save the Event$/, function () {
         // Write code here that turns the phrase above into concrete actions
    });
    
    this.Then(/^update Identity with Event$/, function () {
        // Write code here that turns the phrase above into concrete actions
    });

};
