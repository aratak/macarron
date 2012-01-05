_ = require 'underscore'

result = {}
_.extend result, require('./lib/stub')
_.extend result, require('./lib/mock')

module.exports = result
