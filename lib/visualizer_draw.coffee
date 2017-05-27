
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
      type = command.charAt(0).toUpperCase()
      switch type
        when 'L' then @parseLineCommand command.substring(2, command.length)
        when 'T' then @parseTextCommand command.substring(2, command.length)

    parseLineCommand: (command) ->
      console.log "line " + command
      args = command.split(',')
      startX = parseInt(args[0])
      startY = parseInt(args[1])
      endX = parseInt(args[2])
      endY = parseInt(args[3])
      width = parseInt(args[4])
      @view.drawLine(startX, startY, endX, endY, width, 'rgb(' + args[5] + ',' + args[6] + ',' + args[7] + ')')

    parseTextCommand: (command) ->
      console.log "text " + command

    printAThing: ->
      console.log "a thing"
