import {
  services
  initials
} from '../../src'
service = services()
nTodos = initials.normalizer.todos

import { default as helper } from './helper'
{ getTodos } = helper

export default ->

  todos = yield from getTodos()

  unless todos.length is 0

    n_todos = nTodos todos
    ids = n_todos.result
    for id in ids
      service.delete id

  todos
