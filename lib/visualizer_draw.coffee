
module.exports=
  class VisualizerDraw
    constructor: (@view, @data) ->
      commands = while (@data.length > 0)
        index = @data.indexOf(':')
        length = parseInt(@data.substring(0, index))
        command = @data.substring(index, index + length)
        @data = @data.substring(index + length, @data.length)
        @i = @i + 1
        command


    printAThing: ->
      console.log "a thing"
