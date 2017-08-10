'use strict';

/* jshint -W061 */
// wtf jshint? eval can be harmful? But that is not eval, it's JSONPath#eval
var jsonPath = require('JSONPath').eval;
/* jshint +W061 */
var url = require('url')

var GithubStepsWrapper = function () {

  this.World = require('../support/world.js').World;

  //  this.DB = require('../support/db.js').DB;

  this.Given(/^there are Identity records as follows:$/, function (table, callback) {
    this.connect('user', 'db', 'host',callback());
    //this.conn('Rajesh');
  });

  this.When(/^a valid new Event is received$/, function (callback) {
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

    this.post(
      "/track",
      apiKey,
      JSON.stringify(context),
      callback()
    );

    //console.log(this.lastResponse);
  });

  this.Then(/^save the Event$/, function (callback) {
//    var results = this.findAll();
      console.log(this.lastResponse);
      callback();
  });

  this.Then(/^update Identity with Event$/, function (callback) {
    // express the regexp above with the code you wish you had
    callback.pending();
  });
}

module.exports = GithubStepsWrapper;
