_ = require 'underscore'

deleteAttributes = (obj, attributeNames=[])->
  _.each attributeNames, (attributeName)-> delete obj[attributeName]

exportAttributes = (obj, exportedObj={})->
  _.each _.keys(exportedObj), (attributeName)-> obj[attributeName] = exportedObj[attributeName]

module.exports = {
  stub: (obj, mock={}, options={})->
    original = _.clone obj
    options = _.extend { strictMode: false }, options

    deleteAttributes obj, _.keys(obj) if options.strictMode

    _.extend obj, mock
    _.extend obj, stubs: {
      mockedMethods: _.keys(mock)
      options: options
      original: original
    }
    obj

  unstub: (obj) ->
    return obj unless obj.stubs?
    deleteAttributes(obj, obj.stubs.mockedMethods)
    exportAttributes(obj, obj.stubs.original)
    obj
}
