import dd from 'ddeyes'
import test from 'tape'
import { getStore } from 'cfx.redux'

import addTodos from  './addTodos'
import modifyTodo from './modifyTodo'
import cleanTodos from './cleanTodos'

import { reducers } from '../../src'

tasks = [
  addTodos
  modifyTodo
  cleanTodos
]

test 'Redux Test'
, (t) ->

  store = getStore {
    appName: 'todoApp'
    reducers
    subscriber:
      sync: ->
        state = store.getState()
        unless tasks.length is 0
          task = tasks[0]
          task.test.apply t
          , [
            store
            task
            tasks
          ]
  }

  for task in tasks.slice()
    task.actual store
    , task
    , tasks

  store.onsubscribe()

  t.end()
