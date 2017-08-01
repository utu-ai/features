'use strict';

var expect = require('chai').expect;
var identifier = null;
var restFactory = require("../../rest_factory");

//   Public (Kong) Api:
//   https://api.utu.ai/v1/message
//   header:
//     apiKey: 'xxxxx'
//   body:
//   {
//     "platform": "sms",
//     "platformId": "123-123-1234",
//     "terms": [
//       {"term1": "term1", "prob": ".55"},
//       {"term2": "term2", "prob": ".45"},
//     ],
//     "rawMessage": "<html>green eggs and ham</html>",
//     "message": "green eggs and ham"
//   }

module.exports = function() {

    this.Given(/^there are Identity records as follows:$/, function (table) {
        checkWhetherRecordsPresent();
    });

    this.Given(/^there are Dialog records as follows:$/, function (table) {
        checkWhetherRecordsPresent();
    });

    var checkWhetherRecordsPresent = function(){
        // Call the mongoDB and check whether the table contents are present in the database MongoDB utility
        // If not, insert the contents into the database
        // then validate true to complete this step.
    };

    this.When(/^a valid new message is received for an existing user who is actively dialoging$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.Then(/^save the Message$/, function (callback) {
        // Write code here that turns the phrase above into concrete actions
        callback(null, 'pending');
    });

    this.Then(/^update Dialog with Message$/, function (callback) {
        // Write code here that turns the phrase above into concrete actions
        callback(null, 'pending');
    });

    this.Then(/^update Identity with Message$/, function (callback) {
        // Write code here that turns the phrase above into concrete actions
        callback(null, 'pending');
    });

    this.Then(/^create a summarized Event for Message$/, function (callback) {
        // Write code here that turns the phrase above into concrete actions
        callback(null, 'pending');
    });

    this.When(/^a valid new message is received for an existing user starting a new dialog$/, function (callback) {
        // Write code here that turns the phrase above into concrete actions
        callback(null, 'pending');
    });

    this.When(/^a valid new message is received from a new user$/, function (callback) {
        // Write code here that turns the phrase above into concrete actions
        callback(null, 'pending');
    });

};
