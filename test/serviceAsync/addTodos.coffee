echo = console.log
dd = require 'ddeyes'

{
  initials
  services
} = require '../../src/index'
{ initial } = initials

module.exports = ->

  for text in [
    'Learn about actions'
    'Learn about reducers'
    'Learn about store'
    'Learn about sagas'
  ]
    yield services.create initial.todo text
