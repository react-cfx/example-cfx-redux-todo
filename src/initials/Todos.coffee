cuid = require 'cuid'

{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

module.exports = do ->

  initial =
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
      todos: []
    normalizer
  }
