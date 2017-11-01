import co from 'co'
import dd from 'ddeyes'
import addTodos from './addTodos'
import modifyTodos from './modifyTodos'
import cleanTodos from './cleanTodos'
import { getTodos } from './helper'

tasks = [
  addTodos
  modifyTodos
  cleanTodos
]

co do ->

  for task in tasks
    yield from task()
    dd yield from getTodos()