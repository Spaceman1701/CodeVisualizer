
module.exports=
  class VisualizerDraw
    constructor: (@view, @data) ->
      ratio = parseFloat(@data.substring(0, @data.indexOf('@')))
      @view.setAspectRatio ratio
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

    parseTextCommand: (command) ->
      console.log "text " + command
      start = command.indexOf('"')
      end = command.lastIndexOf('"')
      message = command.substring(start + 1, end)
      data = command.substring(0, start)
      args = data.split(',')
      x = @computeX parseInt(args[0])
      y = @computeY parseInt(args[1])
      @view.drawText x, y, message

    computeX: (x) ->
      height = @view.y
      outX = x * height / 100.0
      outX

    computeY: (y) ->
      height = @view.y
      outY = y * height / 100.0
      outY

    printAThing: ->
      console.log "a thing"
