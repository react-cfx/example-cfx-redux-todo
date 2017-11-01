import dd from 'ddeyes'
import 'shelljs/make'
import {
  constants
  actions
  initials
  services
} from '../../src'

target.all = ->
  target.constants()
  target.actions()
  target.initials()

target.constants = ->
  dd {
    constants
  }

target.actions = ->
  dd Object.keys actions

target.initials = ->
  dd {
    initials
  }

target.services = ->
  dd {
    services
  }