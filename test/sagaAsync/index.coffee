#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
isEqual = require 'is-equal'
gdf = (obj) -> obj.default

onStateChange = gdf require 'redux-on-state-change'

{ createStore } = require 'cfx.redux'
{ SagaMiddleware } = require 'cfx.redux-saga'

require 'coffee-require/register'
{
  reducers
  sagas
} = require '../../src'

EE = require './EventEmitter'

tasks = [
  gdf require './addTodos'
  gdf require './modifyTodo'
  gdf require './cleanTodos'
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
