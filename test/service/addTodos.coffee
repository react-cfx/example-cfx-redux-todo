import * as todos from '../../src'
{
  services
  initials
} = todos
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
