_ = require 'underscore'
should = require 'should'
assert = require 'assert'

describe "stub() with object parameter", ->
  obj = null
  makarron = require '../index'
  stub = makarron.stub
  unstub = makarron.unstub

  beforeEach (done)->
    obj = someAttribute: "foo"
    done()

  it "should return the same object", (done)->
    stub(obj).should.be.equal obj
    done()


  describe "stub", ->

    beforeEach (done)->
      stub(obj, newAttribute: "baz")
      done()

    it "should have original attributes", (done)->
      obj.should.have.property 'someAttribute'
      done()

    it "should return object with defined attributes", (done)->
      obj.should.have.property 'newAttribute'
      done()


  describe "unstub", ->

    beforeEach (done)->
      stub obj, newAttribute: "baz"
      done()

    it "should leave original attributes", (done)->
      unstub(obj).should.have.property 'someAttribute'
      done()

    it "should remove all subbed attributes", (done)->
      unstub(obj).should.not.have.property 'newAttribute'
      done()


  describe "in strict mode", ->

    beforeEach (done)->
      stub(obj, newAttribute: "baz", { strictMode: true })
      done()

    it "should revert existing attribute", (done)->
      unstub(obj).should.have.property 'someAttribute'
      done()

    it "should has no original attributes", (done)->
      obj.should.not.have.property 'someAttribute'
      done()
