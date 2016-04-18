echo = console.log
dd = require 'ddeyes'

{ initial } = require '../../src/initials/index'

services = require '../../src/services/index'

module.exports = ->

  for text in [
    'Learn about actions'
    'Learn about reducers'
    'Learn about store'
    'Learn about sagas'
  ]
    yield services.create initial.todo text
