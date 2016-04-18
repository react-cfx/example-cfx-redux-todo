constants = require '../../src/constants/index'
Types = constants.types
{ SHOW_COMPLETED_TODO } = Types

actions = require '../../src/actions/index'
{ setVisibilityFilter } = actions

{ forPrintSiState } = require '../helper/index'

module.exports =

  msg: 'setVisibilityFilter todo'

  expected:

    visibilityFilter: SHOW_COMPLETED_TODO


  actual: (store, task, tasks) ->

    store.dispatch setVisibilityFilter
      filter: SHOW_COMPLETED_TODO

  test: (store, task, tasks) ->

    state = store.getState()
    { visibilityFilter } = state.todoApp

    dd forPrintSiState state.todoApp

    @equal visibilityFilter
    , task.expected.visibilityFilter
    , task.msg

    tasks.shift()
