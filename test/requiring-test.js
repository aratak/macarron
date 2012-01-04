var coffee = require('coffee-script');
var should = require('should');
var assert = require('assert');

describe("General requirement", function() {
  it("should be required and return object", function(done) {
    require('../index').should.be.a('function');
    done();
  });

  it("result of executing of function should be a object", function(done) {
    require('../index')().should.be.a('object');
    done();
  });

});
