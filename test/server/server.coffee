import { join } from 'path'
import fs from 'fs'
import jsonServer from 'json-server'

dbfile = join "#{__dirname}/todos.json"
if fs.existsSync dbfile
  fs.unlinkSync dbfile

fs.writeFileSync dbfile
,
  JSON.stringify todos: [], '', 2

server = jsonServer.create()
router = jsonServer.router dbfile
middlewares = jsonServer.defaults()

server.use middlewares
server.use router

server.listen 3000
, ->
  console.log 'JSON Server is running'