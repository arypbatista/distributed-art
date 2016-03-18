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

module.exports = (app) ->
  # error handlers

  #catch 404 and forward to error handler
  app.use (req, res, next) ->
    err = new Error 'Not Found'
    err.status = 404
    next err

  # development error handler
  # will print stacktrace
  if app.get 'env' == 'development'
    app.use (err, req, res, next) ->
      code = err.status || 500
      res.status code
      res.json
        code: code
        message: err.message
        error: err

  # production error handler
  # no stacktraces leaked to user
  app.use (err, req, res, next) ->
    code = err.status || 500
    res.status code
    res.json
      code : code
      message: err.message
      error: {}
