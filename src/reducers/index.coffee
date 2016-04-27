{ assign } = Object
{ reduxActions } = require 'cfx.redux-actions'
{
  handleAction
  handleActions
} = reduxActions
SI = require 'cfx.seamless-immutable'
{ mergeReduce } = require 'cfx.redux'

constants = require '../constants/index'
{
  LOAD_TODO_STATE
  ADD_TODO_STATE
  MODIFY_TODO_STATE
  REMOVE_TODO_STATE
} = constants.types

{
  initial
  initialState
} = require '../initials/index'
normalizerTodos = (
  require '../initials/index'
).normalizer.todos

todos = handleActions

  LOAD_TODO_STATE: (state, action) ->
    action.payload.todos

  ADD_TODO_STATE: (state, action) ->
    { todo } = action.payload

    SI.Array.push state
    , [ todo ]

  MODIFY_TODO_STATE: (state, action) ->
    {
      index
      todo
    } = action.payload

    SI.Array.set state, index
    ,
      assign {}, state[index], todo

  REMOVE_TODO_STATE: (state, action) ->
    {
      todoId
    } = action.payload

    todo = (
      normalizerTodos state
    ).entities.todos[todoId]

    SI.Array.removeItem state, todo

# , []

todoApp = mergeReduce {
  todos
}
, initialState

module.exports = todoApp
