import dd from 'ddeyes'

import {
  constants
  actions
  initials
} from '../../src'

export default
  constants: -> dd constants
  actions: -> dd Object.keys actions
  initials: -> dd initials.initial.todo 'hello'
