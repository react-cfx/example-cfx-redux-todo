import dd from 'ddeyes'
import {
  services
  initials
} from '../../src'

service = services()
{ initial } = initials
export default ->

  for text in [
    'Learn about actions'
    'Learn about reducers'
    'Learn about store'
    'Learn about sagas'
  ]
    yield service.create initial.todo text
