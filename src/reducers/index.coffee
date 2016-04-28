{ mergeReduce } = require 'cfx.redux'
{ initialState } = require '../initials/index'

Todos = require './Todos'

todoApp = mergeReduce {
  todos: Todos
}
, initialState

module.exports = todoApp
