import dd from 'ddeyes'
import { services } from '../../src'
service = services()
import { getTodos } from './helper'

export default ->

  todos = yield getTodos()

  expected = [
      index: 1
      todo:
        completed: true
    ,
      index: 2
      todo:
        text: 'Learn about redux'
  ]

  for waitConf in expected

    newTodo = Object.assign {}
    , todos[waitConf.index]
    , waitConf.todo

    service.update newTodo
