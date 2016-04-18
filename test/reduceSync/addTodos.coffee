constants = require '../../src/constants/index'
Types = constants.types
{ SHOW_ALL_TODO } = Types

actions = require '../../src/actions/index'
{ addTodoState } = actions

{ initial } = require '../../src/initials/index'

{ forPrintSiState } = require '../helper/index'

SI = require 'cfx.seamless-immutable'

module.exports =

  msg: 'add todos'

  expected:
    visibilityFilter: SHOW_ALL_TODO
    todos: [
        text: 'Learn about actions'
        completed: false
      ,
        text: 'Learn about reducers'
        completed: false
      ,
        text: 'Learn about store'
        completed: false
      ,
        text: 'Learn about sagas'
        completed: false
    ]

  actual: (store, task, tasks) ->

    for waitTodo in task.expected.todos

      store.dispatch addTodoState
        todo: initial.todo waitTodo.text

  test: (store, task, tasks) ->

    state = store.getState()

    { todos } = state.todoApp

    return unless todos.length is 4

    expected = SI.Array.eachAsMutable todos
    , (siTodo) ->
      siTodo.without 'id'

    dd forPrintSiState state.todoApp

    @deepEqual task.expected.todos
    , expected, task.msg

    tasks.shift()
