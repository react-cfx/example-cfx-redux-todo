echo = -> console.log arguments

checkStatus = (res) ->
  if res.status >= 200 and res.status < 300
    return res
  else
    error = new Error res.statusText
    error.response = res
    throw error

module.exports = (fetchFun, url) ->

  fetch: ->
    promise = fetchFun url.todos
    promise.then (res) -> checkStatus res
    .then (res) -> res.json()
    .catch (ex) -> throw new Error ex

  create: (todo) ->
    promise = fetchFun url.todos
    ,
      method: 'POST'
      headers:
        Accept: 'application/json'
        'Content-Type': 'application/json'
      body: JSON.stringify todo
    promise.then (res) -> checkStatus res
    .then (res) -> res.json()
    .catch (ex) -> throw new Error ex

  update: (newTodo) ->
    promise = fetchFun "#{url.todos}/#{newTodo.id}"
    ,
      method: 'PATCH'
      headers:
        Accept: 'application/json'
        'Content-Type': 'application/json'
      body: JSON.stringify newTodo
    promise.then (res) -> checkStatus res
    .then (res) -> res.json()
    .catch (ex) -> throw new Error ex

  delete: (todoId) ->
    promise = fetchFun "#{url.todos}/#{todoId}"
    ,
      method: 'DELETE'
    promise.then (res) -> checkStatus res
    .then (res) -> res.json()
    .catch (ex) -> throw new Error ex
