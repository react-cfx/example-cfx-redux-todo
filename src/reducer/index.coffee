import dd from 'ddeyes'
import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'
import SI from 'cfx.seamless-immutable'

import constants from '../constant'
import initials from '../initial'

{
  LOAD_TODO_STATE
  ADD_TODO_STATE
  MODIFY_TODO_STATE
  REMOVE_TODO_STATE
} = constants.types

initialState = initials.state
normalizerTodos = initials.normalizer.todos

handler = handleActions

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
      Object.assign {}, state[index], todo

  REMOVE_TODO_STATE: (state, action) ->
    {
      todoId
    } = action.payload

    todo = (
      normalizerTodos state
    ).entities.todo[todoId]

    SI.Array.removeItem state, todo

, []

export default mergeReduce {
  todos: handler
}
, initialState
