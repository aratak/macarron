var _ = require('underscore');
var coffee = require('coffee-script');

result = {};
_.extend(result, require('./lib/stub'));
_.extend(result, require('./lib/mock'));

module.exports = result;
