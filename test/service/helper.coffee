import { services } from '../../src'
service = services()

getTodos = ->
  yield service.fetch()

export {
  getTodos
}
