import dd from 'ddeyes'
import isEqual from 'is-equal'
import onStateChange from 'redux-on-state-change'
import addTodos from './addTodos'
import modifyTodo from './modifyTodo'
import cleanTodos from './cleanTodos'
import { createStore } from 'cfx.redux'
import { SagaMiddleware } from 'cfx.redux-saga'
import {
  reducers
  sagas
} from '../../src'

import EE from './EventEmitter'

tasks = [
  addTodos
  modifyTodo
  cleanTodos
]

subscriber = (
  prevState
  nextState
  action
  dispatch
) ->
  unless action.type is 'LOAD_TODO_STATE'
    return if isEqual prevState, nextState
  unless tasks.length is 0
    tasks[0] store, tasks, action

SagaMW = new SagaMiddleware()

store = createStore
  todoApp: reducers
, [
  SagaMW.getMidleware()
  onStateChange subscriber
]

SagaMW.runSagas sagas

tasks[0] store, tasks
