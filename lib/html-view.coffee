{View} = require 'space-pen'

module.exports =
class HtmlTabView extends View
  constructor: (title) ->
    super
    @x = 640
    @y = 640
    console.log "new"
    atom.workspace.getActivePaneItem().setView(@)


  @content: ->
    @div =>
      @canvas width:@x, height:@y

  getCanvasCtx: ->
    @find('canvas')[0].getContext("2d")

  drawLine: (x, y, endx, endy, width=2, strColor='rgb(0, 0, 0)') ->
    context = @getCanvasCtx()
    context.lineWidth = width
    context.strokeStyle = strColor
    context.beginPath()
    context.moveTo x, y
    context.lineTo endx, endy
    context.stroke()

  clearCanvas: (x, y) ->
    context = @getCanvasCtx()
    context.clearRect 0, 0, @x, @y

  resizeCanvas: (width, height) ->
    canvas = @find('canvas')[0]
    canvas.width = width
    canvas.height = height
