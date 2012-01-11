_ = require 'underscore'

describe "#mock", ->
  obj = null
  macarron = require '../index'
  mock = macarron.mock

  beforeEach (done)->
    obj = someAttribute: "foo", someMethod: -> 1
    done()

  it "should return the same object only with obj parameter", (done) ->
    mock(obj).should.be.equal obj
    done()

  describe "options", ->

    describe ".arguments", ->

      it "should throw exception, if callee.arguments exists", (done) ->
        mock(obj, 'someMethod')
        (-> obj.someMethod("another", "parameters") ).should['throw']();
        done()

      it "should be ok, if callee.arguments is empty", (done) ->
        mock(obj, 'someMethod')
        (-> obj.someMethod() ).should.not.throw()
        done()

      it "should thow exception, callee.arguments is not equal options.arguments", (done) ->
        mock(obj, 'someMethod', 'arguments': ['parameter'] )
        (-> obj.someMethod("another", "parameters")).should['throw']()
        done()

    describe ".count", (done) ->

      it "should throw exception with value 'zero' and calling function once", (done) ->
        mock obj, 'someMethod', count: 0
        (-> obj.someMethod() ).should.throw()
        done()

      it "one by default", (done) ->
        mock(obj, 'someMethod')
        (-> obj.someMethod()).should.not.throw()
        (-> obj.someMethod()).should.throw()
        done()

      it "three times method should be called and then throw exception", (done)->
        mock obj, 'someMethod', count: 3
        obj.someMethod() for [0..2]
        (-> obj.someMethod() ).should.throw()
        done()

describe "#unmock", ->
  obj = null
  macarron = require '../index'
  mock = macarron.mock
  unmock = macarron.unmock

  beforeEach (done)->
    obj = someAttribute: "foo", someMethod: -> 1
    done()

  it "should return the same object only with obj parameter", (done) ->
    unmock(mock(obj)).should.be.equal obj
    done()
