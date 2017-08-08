'use strict';

var expect = require('chai').expect;
var identifier = null;
var restFactory = require('../../rest_factory');
var dataFactory = require('../../data_factory');
var Crud = require('node-mongo-crud').Crud;
// Public Api:
// https://makenu.utu.ai/v1/browser-id
// header:
// body:
// {
// }
//
// https://makenu.utu.ai/v1/*
// header:
//  identityId
// body:
// {
// }
// https://makenu.utu.ai/v1/pixel
// header:
// body:
// {
// }
//
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
//
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

    var checkWhetherRecordsPresent = function(callback){
        // Call the mongoDB and check whether the table contents are present in the database MongoDB utility
        var hostname = "ds129143.mlab.com";
        var port = "29143";
        var database = "rajesh-test";
        console.log("I am here...");
        
        dataFactory.findAll(callback());
        // If not, insert the contents into the database
        // then validate true to complete this step.
        //this.restFactory.message('Rajesh');
    };

    this.Given(/^requests originate from inside the cluster$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

    this.Given(/^there are Identity records as follows:$/, function (callback,table) {
        checkWhetherRecordsPresent(callback);
    });

    this.Given(/^there are EventAlgo mappings as follows:$/, function (table, callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.Given(/^request originates from a taggable browser$/, function (callback) {
         callback(null, 'pending');
    });

    this.Given(/^dialog rendered link has NOT been clicked$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.Given(/^there is only one participant in the dialog$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.Given(/^the uTu success pixel has been deployed on a client site$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.Given(/^there are Dialog records as follows:$/, function (callback,table) {
        checkWhetherRecordsPresent(callback);
    });

    this.When(/^request received for a bots apiKey$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

    this.When(/^request received to roll a bots apiKey$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

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

    this.When(/^an Event of type (.*) containing an (.*) is received$/, function (eType, matchKey, callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.When(/^request made for uTu\.ai browserId$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.When(/^the dialog link is clicked$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.When(/^the success pixel is clicked$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.When(/^a valid new message is received for an existing user who is actively dialoging$/, function (callback) {
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

    this.When(/^request received to create bot$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

    this.When(/^request received to update bot$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

    this.When(/^request received to query bot by owner$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

    this.When(/^request received to query bot by owner and bot$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

    this.When(/^a link is to be posted in a dialog$/, function (callback) {
          // Write code here that turns the phrase above into concrete actions
          callback(null, 'pending');
    });

    this.Then(/^the link should be shortened and proxied$/, function (callback) {
          // Write code here that turns the phrase above into concrete actions
          callback(null, 'pending');
    });

    this.Then(/^bot is updated$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

    this.Then(/^return a list of bots$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

    this.Then(/^bot is created$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

    this.Then(/^return the apiKey$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

    this.Then(/^return the apiKey$/, function (callback) {
      // Write code here that turns the phrase above into concrete actions
      callback(null, 'pending');
    });

    this.Then(/^the browser should be tagged for the utu\.ai domain$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.Then(/^uTu\.ai cookieId should be returned$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.Then(/^the browserId should be aliased to the dialog identity$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.Then(/^save the Event$/, function () {
         // Write code here that turns the phrase above into concrete actions
    });

    this.Then(/^update Identity with Event$/, function () {
        // Write code here that turns the phrase above into concrete actions
    });

    this.Then(/^the associated Algo should fire$/, function (callback) {
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

};
