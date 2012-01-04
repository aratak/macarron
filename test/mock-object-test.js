var coffee = require('coffee-script');
var should = require('should');
var assert = require('assert');

describe("mock() with object parameter", function() {

  describe("without second argument", function() {
    var obj;
    var mock = require('../index');

    beforeEach(function(done) {
      obj = { someAttribute: "foo" };
      done();
    });

    it("should return empty object", function() {
      mock(obj).should.not.have.property('someAttribute');
    });
  });

});
