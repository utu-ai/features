'use strict';

/* jshint -W061 */
// wtf jshint? eval can be harmful? But that is not eval, it's JSONPath#eval
var jsonPath = require('JSONPath').eval;
/* jshint +W061 */
var url = require('url');

var expect = require('chai').expect;
//var IdentityDataGen = require('../support/generators/identity_data_generators').IdentityDataGen;

var GithubStepsWrapper = function (callback) {

  this.World = require('../support/world.js').World;

  //  this.DB = require('../support/db.js').DB;

  this.Given(/^no records exist that match the new identity$/, function (callback) {
    this.createIdentityData('data/identity.json', 'VALID_RECORD',callback);
    this.connect(callback);
    console.log(this);
    //callback();
  });

  this.When(/^an unmatchable update is received for that identity$/, function (callback) {
    // express the regexp above with the code you wish you had
    callback.pending();
  });

  this.Then(/^upsert identity$/, function (callback) {
    // express the regexp above with the code you wish you had
    callback.pending();
  });
}

module.exports = GithubStepsWrapper;
