#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
isEqual = require 'is-equal'

onStateChange = (
  require 'redux-on-state-change'
).default

{ createStore } = require 'cfx.redux'
{ createSagaMiddleware } = require 'cfx.redux-saga'

{
  reducers
  sagas
} = require '../../src/index'

EE = require './EventEmitter'

task =
  cleanTodos: require './cleanTodos'
  addTodos: require './addTodos'
  modifyTodo: require './modifyTodo'

tasks = [
  task.cleanTodos
  task.addTodos
  task.modifyTodo
  task.cleanTodos
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

store = createStore
  todoApp: reducers
, [
  createSagaMiddleware sagas
  onStateChange subscriber
]

tasks[0] store, tasks
