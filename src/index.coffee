module.exports = do ->
  constants = require './constants/index'
  constants: constants
  types: constants.types
  actions: require './actions/index'
  initials: require './initials/index'
  reducers: require './reducers/index'
  sagas: require './sagas/index'
  services: require './services/index'
