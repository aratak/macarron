# About

pending...

# Installation

Add 'macarron' to your `package.json` in section `devDependencies` near you favorite tests framework, because you don't need that in production mode.
After `npm install .` from project root, require this lib in test:

``` javascript

  var macarron = require('macarron');
  var mock = macarron.mock;
  var unstub = macarron.unstub;
  var stub = macarron.stub;
  var unstub = macarron.unstub;

```

# Usage

For the mocking the object methods use `macarron.mock` with the
following signature:

``` javascript
  stub(obj, { stubedMethod: function() { /* stubed function */ } })
```

penging...

# Testing

[![](https://secure.travis-ci.org/aratak/macarron.png)](http://travis-ci.org/aratak/macarron)

`npm test` or `NODE_ENV=test mocha`

# Contributing

I encourage you to contribute to Macarron!
Please ensure that you provide appropriate test coverage and ensure the documentation is up-to-date. Bonus points if you perform your changes in a clean topic branch rather than master, and if you create a pull request for your changes to be discussed and reviewed.

Please also keep your commits atomic so that they are more likely to apply cleanly. That means that each commit should contain the smallest possible logical change. Don’t commit two features at once, don’t update the gemspec at the same time you add a feature, don’t fix a whole bunch of whitespace in a file at the same time you change a few lines, etc, etc.

For significant changes, you may wish to discuss your idea [here](https://github.com/aratak/macarron/issues).

# Project name genesis

Watch on Youtube:

[![](http://i1.ytimg.com/vi/Xs46Zq6I7-E/default.jpg)](http://www.youtube.com/watch?v=l12Csc_lW0Q)
