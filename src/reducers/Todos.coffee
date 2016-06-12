{ assign } = Object
{ reduxActions } = require 'cfx.redux-actions'
{
  handleAction
  handleActions
} = reduxActions
SI = require 'cfx.seamless-immutable'


constants = require '../constants/Todos'
{
  LOAD_TODO_STATE
  ADD_TODO_STATE
  MODIFY_TODO_STATE
  REMOVE_TODO_STATE
} = constants.types

normalizerTodos = (
  require '../initials/Todos'
).normalizer.todos

module.exports = handleActions

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

    unless index
      index = state.reduce (result, current, _index, array) ->
        if current.id is todo.id
        then _index
        else result
      , null

    # TODO The todo is not exist.

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
