SI = require 'cfx.seamless-immutable'

forPrintSiState = (state) ->

  visibilityFilter: state.visibilityFilter
  todos: SI.Array.eachAsMutable state.todos

module.exports = {
  forPrintSiState
}
