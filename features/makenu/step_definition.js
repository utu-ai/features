'use strict';

var expect = require('chai').expect;
var identifier = null;
var restFactory = require("../../rest_factory");

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

module.exports = function() {

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

};
