echo = console.log
dd = require 'ddeyes'
services = require '../../src/services/index'
normalizerTodos = (
  require '../../src/initials/index'
).normalizer.todos
{ getTodos } = require './helper'

module.exports = ->

  todos = yield getTodos()

  unless todos.length is 0

    normalizer = normalizerTodos todos
    ids = normalizer.result
    for id in ids
      services.delete id

  else return
