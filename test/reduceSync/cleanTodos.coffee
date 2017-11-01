import dd from 'ddeyes'
import { actions } from '../../src'
import { forPrintSiState } from '../helper'
{ loadTodoState } = actions

export default {

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
  
}

