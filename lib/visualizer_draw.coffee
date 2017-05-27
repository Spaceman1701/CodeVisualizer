
module.exports=
  class VisualizerDraw
    constructor: (@view, @data) ->
      commands = while (@data.length > 0)
        index = @data.indexOf(':')
        length = parseInt(@data.substring(0, index))
        command = @data.substring(index + 1, index + length)
        @data = @data.substring(index + length, @data.length)
        command
      for command in commands
        @parseCommand command

    parseCommand: (command) ->
      console.log command

    printAThing: ->
      console.log "a thing"
