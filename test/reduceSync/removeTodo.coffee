isEqual = require 'is-equal'
{ actions } = require '../../src/index'
{ removeTodoState } = actions
{ forPrintSiState } = require '../helper/index'

module.exports =

  msg: 'remove todo'

  expected: [ 0, 3 ]

  actual: (store, task, tasks) ->

    state = store.getState()

    for index, TodoIndex of task.expected
      continue unless typeof TodoIndex is 'number'
      item = state.todoApp.todos[TodoIndex].asMutable()
      task.expected[index] = item

    store.dispatch removeTodoState
      todoId: task.expected[0].id

  test: (store, task, tasks) ->

    state = store.getState()

    expected = task.expected.shift()
    count = 0
    # dd { expected }
    for todo in state.todoApp.todos
      # dd todo.asMutable()
      count++ if isEqual todo.asMutable, expected

    dd forPrintSiState state.todoApp

    @equal count, 0

    unless task.expected.length is 0

      task.actual store
      , task
      , tasks

    else

      tasks.shift()
