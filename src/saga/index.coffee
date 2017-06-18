import dd from 'ddeyes'
import { default as ReduxSaga } from 'cfx.redux-saga'
{
  sagaEffects
  dispatch
} = ReduxSaga

import { constants } from '../constant'
import { services } from '../service'
service = services()

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
} = constants.types

Async =

  fetch: (action) ->

    yield dispatch action
    , TODO_FETCH_START

    try
      todos = yield sagaEffects.call service.fetch
    catch ex

      yield dispatch action
      , TODO_FETCH_ERROR

      throw new Error ex

    return unless todos

    newAction = Object.assign {}
    , action
    , payload:
      Object.assign action.payload
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
      todoIndex = yield sagaEffects.call service.create
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
      todo = yield sagaEffects.call service.update
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
      yield sagaEffects.call service.delete
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

export sagas = [
  ->
    yield sagaEffects.takeLatest TODO_FETCH
    , Async.fetch
  ->
    yield sagaEffects.takeLatest TODO_CREATE
    , Async.create
  ->
    yield sagaEffects.takeLatest TODO_UPDATE
    , Async.update
  ->
    yield sagaEffects.takeLatest TODO_DELETE
    , Async.delete
]
