#!/usr/bin/env coffee
dd = require 'ddeyes'
test = require 'tape'
{ createStore } = require 'cfx.redux'

gdf = (obj) -> obj.default

require 'coffee-require/register'
{ reducers } = require '../../src'

store = createStore
  todoApp: reducers

tasks = [
  gdf require './addTodos'
  gdf require './modifyTodo'
  gdf require './cleanTodos'
]

test 'Redux Test'
, (t) ->

  unsubscribe = store.subscribe ->
    state = store.getState()
    unless tasks.length is 0
      task = tasks[0]
      task.test.apply t
      , [
        store
        task
        tasks
      ]

  for task in tasks.slice()
    task.actual store
    , task
    , tasks

  unsubscribe()

  t.end()
