# autocomplete-plus provider https://github.com/darkoverlordofdata/autocomplete-vala
# Copyright 2015 Dark Overlord of Data * MIT License

fs = require 'fs'
path = require 'path'

module.exports =
class ValaProvider
  selector: '.source.vala'
  disableForSelector: '.source.vala .comment'
  filterSuggestions: true
  inclusionPriority: 1
  excludeLowerPriority: true

  loadCompletions: ->

  # Required: Return a promise, an array of suggestions, or null.
  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix, activatedManually}) ->
    prefix = @getPrefix(editor, bufferPosition)


    new Promise (resolve) ->
      suggestion =
        text: if prefix is 'fro' then 'froyo' else 'someTextz'
        replacementPrefix: prefix
      resolve([suggestion])

  getPrefix: (editor, bufferPosition) ->
    # Whatever your prefix regex might be
    regex = /[\w0-9_-]+$/

    # Get the text for the line up to the triggered buffer position
    line = editor.getTextInRange([[bufferPosition.row, 0], bufferPosition])

    # Match the regex to the line, and return the match
    line.match(regex)?[0] or ''  # (optional): called _after_ the suggestion `replacementPrefix` is replaced

  # by the suggestion `text` in the buffer
  onDidInsertSuggestion: ({editor, triggerPosition, suggestion}) ->

  # (optional): called when your provider needs to be cleaned up. Unsubscribe
  # from things, kill any processes, etc.
  dispose: ->
