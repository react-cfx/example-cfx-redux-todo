import cuid from 'cuid'

import {
  normalize
  denormalize
  schema
} from 'normalizr'

export initials = do ->

  initial =
    todo: (text) -> {
      id: cuid()
      text
      completed: false
    }

  normalizer =
    todos: (todos) ->
      todoObj = new schema.Entity 'todo'
      , {}, idAttribute: 'id'
      todosSchema = new schema.Array todoObj
      normalize todos, todosSchema

  {
    initial
    state:
      todos: []
    normalizer
  }
