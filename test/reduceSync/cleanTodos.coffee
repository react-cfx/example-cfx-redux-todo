{ actions } = require '../../src/index'
{ loadTodoState } = actions
{ forPrintSiState } = require '../helper/index'

module.exports =

  msg: 'clean todos'

  expected:

    todos: []

  actual: (store, task, tasks) ->

    store.dispatch loadTodoState
      todos: []

  test: (store, task, tasks) ->

    state = store.getState()
    { todos } = state.todoApp

    dd forPrintSiState state.todoApp

    @deepEqual state.todoApp
    , task.expected, task.msg

    tasks.shift()
