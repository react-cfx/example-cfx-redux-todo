#!/usr/bin/env coffee
require 'coffee-require/register'
gdf = (obj) -> obj.default
_static = gdf require './index'

_static.constants()
_static.actions()
_static.initials()
