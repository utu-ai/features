'use strict';

var expect = require('chai').expect;
var identifier = null;
var restFactory = require("../../rest_factory");

// Public Api:
// https://api.utu.ai/v1/identity/'+platform+'/'+platformId
// header:
//     apiKey: 'xxxxx'
// body:
// {
//     "platform": "sms",
//     "platformId": "123-123-1234",
//     "custom": {
//       "var1":"foo",
//       "var2":"bar"
//     }
// }

module.exports = function() {

    /*this.Given(/^there are Identity records as follows:$/, function (table) {
        checkWhetherRecordsPresent();
    });*/

    var checkWhetherRecordsPresent = function(){
        // Call the mongoDB and check whether the table contents are present in the database MongoDB utility
        // If not, insert the contents into the database
        // then validate true to complete this step.
    };

    //TODO: is this just a global step?
    this.Given(/^request contains botKey with right access level$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.When(/^an Identity update is received for a non\-matching field$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.When(/^an Identity search request by (.*) for (.*) type is received$/, function (matchField, medal, callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.When(/^an Identity update is received with (.*)$/, function (matchField, callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.When(/^an aliased foreignId is received$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.Then(/^upsert an Identity tin record$/, function () {
         // Write code here that turns the phrase above into concrete actions
    });
    
    this.Then(/^push update to all medal Identity views$/, function () {
        // Write code here that turns the phrase above into concrete actions
    });

    this.Then(/^push Identity rollup to related services$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

    this.Then(/^review medal match when upserting an Identity tin record$/, function () {
         // Write code here that turns the phrase above into concrete actions
    });
    
    this.Then(/^push impacted Identity rollup to related services$/, function () {
        // Write code here that turns the phrase above into concrete actions
    });

    this.Then(/^return the requested Identity record\(s\) or an appropriate response$/, function (callback) {
         // Write code here that turns the phrase above into concrete actions
         callback(null, 'pending');
    });

};
