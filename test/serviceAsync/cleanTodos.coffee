echo = console.log
dd = require 'ddeyes'
{
  initials
  services
} = require '../../src/index'
normalizerTodos = initials.normalizer.todos
{ getTodos } = require './helper'

module.exports = ->

  todos = yield getTodos()

  unless todos.length is 0

    normalizer = normalizerTodos todos
    ids = normalizer.result
    for id in ids
      services.delete id

  else return
