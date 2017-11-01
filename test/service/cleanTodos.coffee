import {
  services
  initials
} from '../../src'
service = services()
nTodos = initials.normalizer.todos

import { getTodos } from './helper'

export default ->

  todos = yield getTodos()

  unless todos.length is 0

    n_todos = nTodos todos
    ids = n_todos.result
    for id in ids
      service.delete id

  todos
