_ = require 'underscore'

module.exports = {
  mock: (obj, attributeName, options={})->
    obj
  unmock: (obj) -> obj
}


# mock(s, 'methodName', {'returns': 5, 'arguments': [12, 34, 5], 'count': 10 }, callback);
