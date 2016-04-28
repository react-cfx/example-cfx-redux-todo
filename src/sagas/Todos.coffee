{ assign } = Object

{
  saga
  sagaEffects
  dispatch
} = require 'cfx.redux-saga'
{ takeEvery } = require 'redux-saga'
{ call } = sagaEffects

constants = require '../constants/index'
Types = constants.types

services = require '../services/index'

{
  TODO_FETCH
  TODO_FETCH_START
  TODO_FETCH_SUCCESS
  TODO_FETCH_ERROR
  LOAD_TODO_STATE

  TODO_CREATE
  TODO_CREATE_START
  TODO_CREATE_SUCCESS
  TODO_CREATE_ERROR
  ADD_TODO_STATE

  TODO_UPDATE
  TODO_UPDATE_START
  TODO_UPDATE_SUCCESS
  TODO_UPDATE_ERROR
  MODIFY_TODO_STATE

  TODO_DELETE
  TODO_DELETE_START
  TODO_DELETE_SUCCESS
  TODO_DELETE_ERROR
  REMOVE_TODO_STATE
} = Types

Async =

  fetch: (action) ->

    yield dispatch action
    , TODO_FETCH_START

    try
      todos = yield call services.fetch
    catch ex

      yield dispatch action
      , TODO_FETCH_ERROR

      throw new Error ex

    return unless todos

    newAction = assign {}
    , action
    , payload:
      assign action.payload
      , { todos }

    yield dispatch newAction
    , TODO_FETCH_SUCCESS

    yield dispatch newAction
    , LOAD_TODO_STATE

    return

  create: (action) ->

    yield dispatch action
    , TODO_CREATE_START

    try
      todoIndex = yield call services.create
      , action.payload.todo
    catch ex

      yield dispatch action
      , TODO_CREATE_ERROR

      throw new Error ex

    return unless todoIndex

    yield dispatch action
    , TODO_CREATE_SUCCESS

    yield dispatch action
    , ADD_TODO_STATE

    return

  update: (action) ->

    yield dispatch action
    , TODO_UPDATE_START

    try
      todo = yield call services.update
      , action.payload.todo
    catch ex

      yield dispatch action
      , TODO_UPDATE_ERROR

      throw new Error ex

    return unless todo

    yield dispatch action
    , TODO_UPDATE_SUCCESS

    yield dispatch action
    , MODIFY_TODO_STATE

    return

  delete: (action) ->

    yield dispatch action
    , TODO_DELETE_START

    try
      yield call services.delete
      , action.payload.todoId
    catch ex

      yield dispatch action
      , TODO_DELETE_ERROR

      throw new Error ex

    yield dispatch action
    , TODO_DELETE_SUCCESS

    yield dispatch action
    , REMOVE_TODO_STATE

    return

module.exports = [
  ->
    yield from takeEvery TODO_FETCH
    , Async.fetch
  ->
    yield from takeEvery TODO_CREATE
    , Async.create
  ->
    yield from takeEvery TODO_UPDATE
    , Async.update
  ->
    yield from takeEvery TODO_DELETE
    , Async.delete
]
