#!/usr/bin/env coffee
{ join } = require 'path'
{
  create
  defaults
  router
} = require 'json-server'

server = create()

server.use defaults()
server.use '/'
, router join "#{__dirname}/todos.json"

server.listen 3000
