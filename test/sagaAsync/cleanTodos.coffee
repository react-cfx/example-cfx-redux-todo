echo = console.log
import dd from 'ddeyes'
import EE from './EventEmitter'

import { initials } from '../../src'
normalizerTodos = initials.normalizer.todos

export default (store, tasks, action) ->
  { dispatch } = store

  return EE.emit 'todoFetch'
  , dispatch unless action

  try
    { todos } = action.payload
  catch ex

  if todos

    unless todos.length is 0

      normalizer = normalizerTodos todos
      ids = normalizer.result

      return EE.emit 'todoDelete'
      , dispatch
      ,
        todoId: ids.shift()
        waitList: ids

    else

      return EE.emit 'tasksShift'
      , store, tasks

  try
    {
      todoId
      waitList
    } = action.payload
  catch ex

  unless waitList?.length is 0

    return EE.emit 'todoDelete'
    , dispatch
    ,
      todoId: waitList.shift()
      waitList: waitList

  else

    return EE.emit 'todoFetch'
    , dispatch
