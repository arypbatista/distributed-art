###
# Copyright (C) 2016  Ary Pablo Batista <arypbatista@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
###

logger  = require 'morgan'
favicon = require 'serve-favicon'
path    = require 'path'
cookieParser = require 'cookie-parser'
bodyParser   = require 'body-parser'
express = require 'express'


module.exports = (app) ->

  # view engine setup
  app.set 'views', path.join(__dirname, '../views')
  app.set 'view engine', 'jade'

  # uncomment after placing your favicon in /public
  # app.use favicon(path.join(__dirname, 'public', 'favicon.ico'))
  app.use logger('dev')
  app.use bodyParser.json()
  app.use bodyParser.urlencoded({ extended: false })
  app.use cookieParser()
  app.use express.static(path.join(__dirname, '../public'))
