should = require "should"
assert = require "assert"

describe "General requirement", ->
  makarron = require "../index"

  it "should be required and return object", (done) ->
    makarron.should.be.a "object"
    done()

  it "should have mock attributes as function", (done) ->
    makarron.should.have.property "mock"
    done()

  it "should have stub attributes as function", (done) ->
    makarron.should.have.property "stub"
    done()

  it "should have unstub attribute as function", (done) ->
    makarron.should.have.property "unstub"
    done()
