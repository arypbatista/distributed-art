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

express = require 'express'
router  = express.Router()
request = require 'request'
_       = require 'underscore'
shuffle = _.shuffle

artists = require '../../data/artists'

router.get '/artist/:id/art', (req, res, next) ->
  artist = artists[req.params.id].site
  request.get(shuffle(artists[req.params.id].images)[0]).pipe(res)

router.get '/artist/:id/site', (req, res, next) ->
  res.redirect artists[req.params.id].site

module.exports = router
