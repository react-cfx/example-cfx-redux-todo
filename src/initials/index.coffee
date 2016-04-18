cuid = require 'cuid'
constants = require '../constants/index'
{ SHOW_ALL_TODO } = constants.types

{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

module.exports = do ->

  initial =
    visibilityFilter: SHOW_ALL_TODO
    todo: (text) -> {
      id: cuid()
      text
      completed: false
    }

  normalizer =
    todos: (todos) ->
      normalizer = normalize todos
      , arrayOf new Schema 'todos'

  {
    initial
    initialState:
      # TODO coffee support
      #   { visibilityFilter }: initial
      visibilityFilter: initial.visibilityFilter
      todos: []
    normalizer
  }
