{View} = require 'space-pen'
electron = require "electron"

module.exports =
class HtmlTabView extends View
  constructor: (title) ->
    super

    console.log "new"
    atom.workspace.getActivePaneItem().setView(@)
    console.log atom.styles.getUserStyleSheetPath()

  initialize: ->
    w = atom.workspace.getActivePane().element.clientWidth - 32
    h = atom.workspace.getActivePane().element.clientHeight - 64
    @resizeCanvas(w, h)

  @content: ->
    @div =>
      @canvas width:@x, height:@y, style:"border:2px solid #000000;"

  setAspectRatio: (ratio) ->
    if ratio > 1
      scale = 1.0 / ratio
      @y = @x * scale
    else if ratio < 1
      @x = ratio * @y
    else
      if @x < @y
        @y = @x
      else
        @x = @y
    @resizeCanvas @x, @y

  getCanvasCtx: ->
    ctx = @find('canvas')[0].getContext("2d")
    ctx.setTransform(1, 0, 0, 1, 0, 0);
    ctx

  drawLine: (x, y, endx, endy, width=2, strColor='rgb(0, 0, 0)', shadow=0) ->
    context = @getCanvasCtx()
    context.lineWidth = width
    context.strokeStyle = strColor
    context.shadowBlur=shadow
    context.shadowColor='black'
    context.beginPath()
    context.moveTo x, y
    context.lineTo endx, endy
    context.stroke()

  drawText: (x, y, text, strColor='rgb(255, 255, 255)', shadow=0) ->
    console.log "text"
    ctx = @getCanvasCtx()
    ctx.font = "30px Arial"
    ctx.fillStyle = strColor
    ctx.shadowBlur=shadow
    ctx.shadowColor='black'
    ctx.fillText text, x, y

  clearCanvas: (x, y) ->
    context = @getCanvasCtx()
    context.clearRect 0, 0, @x, @y

  resizeCanvas: (width, height) ->
    canvas = @find('canvas')[0]
    canvas.width = width
    canvas.height = height
    @x = width
    @y = height
