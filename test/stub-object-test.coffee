_ = require 'underscore'

describe "#stub", ->
  obj = null
  macarron = require '../index'
  stub = macarron.stub
  unstub = macarron.unstub

  beforeEach (done)->
    obj = someAttribute: "foo"
    done()

  it "should return the same object only with object parameter", (done)->
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

describe "#unstub", ->
  obj = null
  macarron = require '../index'
  stub = macarron.stub
  unstub = macarron.unstub

  beforeEach (done)->
    obj = someAttribute: "foo"
    stub obj, newAttribute: "baz"
    done()

  it "should return the same object only with object parameter", (done)->
    unstub(stub(obj)).should.be.equal obj
    done()

  it "should leave original attributes", (done)->
    unstub(obj).should.have.property 'someAttribute'
    done()

  it "should remove all subbed attributes", (done)->
    unstub(obj).should.not.have.property 'newAttribute'
    done()



