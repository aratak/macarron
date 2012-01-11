should = require "should"

describe "General requirement", ->
  macarron = require "../index"

  it "should be required and return object", (done) ->
    macarron.should.be.a "object"
    done()

  it "should have mock attributes as function", (done) ->
    macarron.should.have.property "mock"
    done()

  it "should have stub attributes as function", (done) ->
    macarron.should.have.property "stub"
    done()

  it "should have unstub attribute as function", (done) ->
    macarron.should.have.property "unstub"
    done()
