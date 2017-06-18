import * as todos from '../../src'
{ services } = todos
service = services()

getTodos = ->
  yield service.fetch()

export default {
  getTodos
}
