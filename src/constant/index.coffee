import {
  toActionsTypes
  mergeActionsTypes
} from 'cfx.redux-types'
import { crudActionsTypes } from 'cfx.redux-crud'

export constants = mergeActionsTypes
  Entry: toActionsTypes {
    'LOAD_TODO'
    'ADD_TODO'
    'MODIFY_TODO'
    'REMOVE_TODO'
  }
  Fetch: crudActionsTypes 'todo'
  State: toActionsTypes {
    'LOAD_TODO_STATE'
    'ADD_TODO_STATE'
    'MODIFY_TODO_STATE'
    'REMOVE_TODO_STATE'
    'SET_VISIBILITY_FILTER'
  }
