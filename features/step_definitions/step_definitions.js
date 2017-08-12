this.Given(/^no records exist that match the new identity:$/, function (table, callback) {
  this.connect(callback);
  //1. create a random new Tin record
  //https://app.swaggerhub.com/apis/uTu.ai/identity-public/1.0.0
});

this.Given(/^a number of related, but unmatched identity records exist:$/, function (table, callback) {
  this.connect(callback);
  //1. create 3x new tin records.  Do not provide any matching criteria between them
  // but know, they are for the same person ultimately.
  // can this be fed from the data sets?  the nuance of the data combinations is
  // in the medaling spreadsheet.
});

this.Given(/^existing identity records have associated events:$/, function (table, callback) {
  this.connect(callback);
  //1. for any identity records just created, go ahead and create some bogus events for them. 
});

this.When(/^an unmatchable update is received for that identity:$/, function (table, callback) {
  this.connect(callback);
  //1. try updating any identity {custom} field
});

this.When(/^a matchable update is received for that identity:$/, function (table, callback) {
  this.connect(callback);
  // create an identity update that includes email
  // create an identity update that includes browserId
  // etc.
  // same point as the given really.  There are MANY combinations that could be tested here
  // where and how do these combinations get inputted?

this.Then(/^upsert identity:$/, function (table, callback) {
  this.connect(callback);
  // there should exist a singular tin record that reflects recent update
  // there should exist a singular bronze record that reflects recent update
  // there should exist a singular gold record that reflects recent update
  // if a new match was made across existing identity records, the combination
  // of data - the merge - should be reflected in the bronze and gold records
  // this final identity view should be denorm'd to related events

});
