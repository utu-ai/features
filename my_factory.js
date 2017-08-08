'use strict';
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

var speak = function () {
  return 'moo'
}

const myFactory = {
  speak,
}

export default myFactory;

module.exports.myFactory = myFactory;
