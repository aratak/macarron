class Mock
  constructor: (@originalObject)->
    console.log('constructor')

module.exports = (args...)-> new Mock(args...)
