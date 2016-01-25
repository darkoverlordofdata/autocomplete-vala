ValaProvider = require('./vala-provider')
{exec} = require 'child_process'
path = require 'path'

module.exports =
  activate: ->
    @getProvider().loadCompletions()

  getProvider: -> new ValaProvider()
