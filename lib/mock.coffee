_ = require 'underscore'

deleteAttributes = (obj, attributeNames=[])->
  _.each attributeNames, (attributeName)-> delete obj[attributeName]

module.exports = {
  mock: (obj, attributeName, options={})->
    original = _.clone obj
    options = _.extend {
      'returns': undefined
      'arguments': []
      'count': undefined
      'strictMode': false
    }, options

    deleteAttributes obj, _.keys(obj) if options.strictMode?

    _.extend obj, {
      "#{attributeName}": ->
      mocks: {
        options: options,
        original: original
      }
    }


    obj
  unmock: (obj) -> obj
}


# mock(s, 'methodName', {'returns': 5, 'arguments': [12, 34, 5], 'count': 10 }, callback);
