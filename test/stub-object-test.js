var coffee = require('coffee-script');
var should = require('should');
var assert = require('assert');

describe("mock() with object parameter", function() {

  describe("without second argument", function() {
    var obj;
    var makarron = require('../index');
    var stub = makarron.stub;
    var unstub = makarron.unstub;


    beforeEach(function(done) {
      obj = { someAttribute: "foo" };
      done();
    });

    it("should return the same object", function() {
      stub(obj).should.be.equal(obj);
    });

    it("should have original attributes", function() {
      stub(obj).should.have.property('someAttribute');
    });

    it("should return object with defined attributes", function() {
      stub(obj, { newAttribute: "baz" }).should.have.property('newAttribute');
    });

    it("should remove all subbed attributes", function() {
      stub(obj, {newAttribute: "baz"});
      unstub(obj).should.not.have.property('newAttribute');
    });

  });

});
