SI = require 'cfx.seamless-immutable'

forPrintSiState = (state) ->

  todos: SI.Array.eachAsMutable state.todos

module.exports = {
  forPrintSiState
}
