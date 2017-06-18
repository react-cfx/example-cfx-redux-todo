echo = console.log
import dd from 'ddeyes'
import EventEmitter from 'eventemitter3'
import isEqual from 'is-equal'
import jsonfile from 'jsonfile'

import { actions } from '../../src'
import { forPrintSiState } from '../helper'

{
  todoFetch
  todoCreate
  todoUpdate
  todoDelete
} = actions

EE = new EventEmitter()

EE.on 'todoFetch'
, (dispatch, action = {}) ->
  dispatch todoFetch action

EE.on 'todoCreate'
, (dispatch, action = {}) ->
  dispatch todoCreate action

EE.on 'todoUpdate'
, (dispatch, action = {}) ->
  dispatch todoUpdate action

EE.on 'todoDelete'
, (dispatch, action = {}) ->
  dispatch todoDelete action

EE.on 'tasksShift'
, (store, tasks) ->

  tasks.shift()

  todoApp = forPrintSiState store.getState().todoApp
  todos = todoApp.todos
  jsonTodos = (
    jsonfile.readFileSync '../todos.json'
  ).todos


  unless isEqual todos, todoApp.todos
    throw new Error 'Data is not Synced.'
  else
    dd todos
    tasks[0] store, tasks unless tasks.length is 0

export default EE
