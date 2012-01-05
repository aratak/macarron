var coffee = require('coffee-script');
var should = require('should');
var assert = require('assert');

describe("General requirement", function() {
  it("should be required and return object", function(done) {
    require('../index').should.be.a('object');
    done();
  });

  it("should have mock attributes as function", function(done) {
    require('../index').should.have.property('mock');
    done();
  });

  it("should have stub attributes as function", function(done) {
    require('../index').should.have.property('stub');
    done();
  });

  it("should have unstub attribute as function", function(done) {
    require('../index').should.have.property('unstub');
    done();
  });

});
