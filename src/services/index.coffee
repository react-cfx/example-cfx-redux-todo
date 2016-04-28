{ assign } = Object
fetch = require 'node-fetch'

resource =
  host: 'localhost'
  port: 3000
  router:
    todos: 'todos'

url = do ->
  baseUrl = "http://#{resource.host}:#{resource.port}"
  todos: "#{baseUrl}/#{resource.router.todos}"

Todos = (
  require './Todos'
) fetch, url

module.exports = assign {}
, Todos
