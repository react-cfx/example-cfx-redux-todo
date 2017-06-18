import SI from 'cfx.seamless-immutable'

forPrintSiState = (state) ->

  todos: SI.Array.eachAsMutable state.todos

export {
  forPrintSiState
}
