_ = require 'underscore'
util = require 'util'

deleteAttributes = (obj, attributeNames=[])->
  _.each attributeNames, (attributeName)-> delete obj[attributeName]

module.exports = {
  mock: (obj, attributeName, options={})->
    original = _.clone obj
    options = _.extend {
      'returns': undefined
      'arguments': []
      'count': 1
      'strictMode': false
    }, options

    deleteAttributes obj, _.keys(obj) if options.strictMode

    _.extend obj, mocks: {}
    _.extend obj.mocks, {
      methods: {}
      options: options
      original: original
    }

    if attributeName
      obj.mocks.methods[attributeName] = { callCounter: 0 }

      obj[attributeName] = ->
        obj.mocks.methods[attributeName].callCounter += 1
        if obj.mocks.methods[attributeName].callCounter > options.count
          throw "Method #{util.inspect(attributeName)} has been called more times, that expected."

        if not  _.isEqual(_.values(arguments), options.arguments)
          throw "Method #{util.inspect(attributeName)} has been called with wrong arguments signature. Expected: #{util.inspect(options['arguments'])}, actual: #{util.inspect(_.values(arguments))}"
        return options['returns']
    obj
    obj
  unmock: (obj) -> obj
}


# mock(s, 'methodName', {'returns': 5, 'arguments': [12, 34, 5], 'count': 10 }, callback);
