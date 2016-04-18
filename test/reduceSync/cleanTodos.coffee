constants = require '../../src/constants/index'
Types = constants.types
{ SHOW_COMPLETED_TODO } = Types

actions = require '../../src/actions/index'
{ loadTodoState } = actions

{ forPrintSiState } = require '../helper/index'

module.exports =

  msg: 'clean todos'

  expected:

    visibilityFilter: SHOW_COMPLETED_TODO
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
