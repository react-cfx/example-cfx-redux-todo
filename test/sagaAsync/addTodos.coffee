echo = console.log
import dd from 'ddeyes'
import EE from './EventEmitter'

import { initials } from '../../src'
{ initial } = initials

export default (store, tasks, action) ->
  { dispatch } = store

  try
    { waitList } = action.payload
  catch ex

  unless waitList

    waitList = [
      'Learn about actions'
      'Learn about reducers'
      'Learn about store'
      'Learn about sagas'
    ]

  unless waitList.length is 0

    return EE.emit 'todoCreate'
    , dispatch
    ,
      todo: initial.todo waitList.shift()
      waitList: waitList

  else

    return EE.emit 'tasksShift'
    , store, tasks
