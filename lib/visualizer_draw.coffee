
module.exports=
  class VisualizerDraw
    constructor: (@view, @data) ->
      ratio = parseFloat(@data.substring(0, @data.indexOf('@')))
      @data = @data.substring(@data.indexOf('@') + 1, @data.length)
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
      args = command.split(',')
      startX = @computeX parseInt(args[0])
      startY = @computeY parseInt(args[1])
      endX = @computeX parseInt(args[2])
      endY = @computeY parseInt(args[3])
      width = parseInt(args[4])
      @view.drawLine(startX, startY, endX, endY, width, 'rgb(' + args[5] + ',' + args[6] + ',' + args[7] + ')')

    computeX: (x) ->
      height = @view.y
      outX = x * height / 100.0
      outX

    computeY: (y) ->
      height = @view.y
      outY = y * height / 100.0
      outY

    parseTextCommand: (command) ->
      console.log "text " + command


    printAThing: ->
      console.log "a thing"
