'use strict';

var MongoClient = require('mongodb').MongoClient;
/*
** FlowRouter helpers
*/
// const pathFor = (path, params) => {
//   const query = params && params.query ? FlowRouter._qs.parse(params.query) : {};
//   return FlowRouter.path(path, params, query);
// };
//
// const urlFor = (path, params) => {
//   let response = pathFor(path, params);
//   response = response.replace(/^\/|\/$/g, '');
//   return Meteor.absoluteUrl(response);
// };
//
// const currentRoute = (route) => {
//   FlowRouter.watchPathChange();
//   return FlowRouter.current().route.name === route ? 'active' : '';
// };
//
// const FlowHelpers = {
//   pathFor,
//   urlFor,
//   currentRoute,
// };

// export default {
//   speak () {
//     return 'moo'
//   },
//   eat () {
//     return 'cow eats'
//   },
//   drink () {
//     return 'cow drinks'
//   }
// }

var myFunc1 = function() {
  console.log("fun1");
};
var myFunc2 = function() {
  console.log("fun2");
  // rajesh:test1234@ds129143.mlab.com:29143/rajesh-test", function(err, db) {
  // MongoClient.connect("mongodb://"+configuration.MONGO_USER+":"+configuration.MONGO_PWD+"@"+configuration.MONGO_HOST+"/"+configuration.MONGO_DB, function(err, db) {
  MongoClient.connect("mongodb://rajesh:test1234@ds129143.mlab.com:29143/rajesh-test", function(err, db) {
    if(!err) {
      console.log("We are connected");
    } else {
      console.log(err);
      console.log("bite me!");
    }
  });
};

function Person(first, last, age, eyecolor) {
    this.firstName = first;
    this.lastName = last;
    this.age = age;
    this.eyeColor = eyecolor;
    console.log("Person");
};

Person.prototype.name = function() {
  console.log("in name");
    return this.firstName + " " + this.lastName
};

exports.Person = Person;
exports.myFunc2 = myFunc2;
exports.myFunc1 = myFunc1;
