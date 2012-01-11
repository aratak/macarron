_ = require 'underscore'

describe "#mock", ->
  obj = null
  makarron = require '../index'
  mock = makarron.mock

  beforeEach (done)->
    obj = someAttribute: "foo", someMethod: -> 1
    done()

  it "should return the same object only with obj parameter", (done) ->
    mock(obj).should.be.equal obj
    done()

describe "#unmock", ->
  obj = null
  makarron = require '../index'
  mock = makarron.mock
  unmock = makarron.unmock

  beforeEach (done)->
    obj = someAttribute: "foo", someMethod: -> 1
    done()

  it "should return the same object only with obj parameter", (done) ->
    unmock(mock(obj)).should.be.equal obj
    done()
