#!/usr/bin/env coffee
co = require 'co'
dd = require 'ddeyes'
require 'coffee-require/register'

gdf = (obj) -> obj.default
{ getTodos } = gdf require './helper'

tasks = [
  gdf require './addTodos'
  gdf require './modifyTodos'
  gdf require './cleanTodos'
]

co do ->

  for task in tasks
    yield from task()
    dd yield from getTodos()
