_ = require 'underscore'
p = console.log

class Stub
  @unstub: ->

  constructor: (@originalObject, @mockedObject={})->
    @extend()
    @injectSelf()

  injectSelf: ->
    _.extend @originalObject, stub: this

  extend: ->
    _.extend @originalObject, @mockedObject


  obj: -> @originalObject


# class Mock
#   constructor: (originalObject)->



module.exports = {
  stub: (args...)-> new Stub(args...).obj()
  unstub: (args...) -> Stub.unstub(args...)
  mock: (args...)->
}
