VisualizerTab = require './visualizer-tab'
HtmlTab = require './html-view'
VisualizerDraw = require './visualizer_draw'
{CompositeDisposable} = require 'atom'
spawn = require('child_process').spawn
path = require "path"

module.exports =
  func: ->
    console.log "akdsjakhd"

  activate: ->
    @subs = new CompositeDisposable
    @subs.add atom.commands.add 'atom-workspace', 'visualizer:open': ->
      @vt = new VisualizerTab "I'm Alive!"
      atom.workspace.getActivePane().activateItem @vt
      v = @vt.getView()
      v.resizeCanvas 800, 800
      v.drawLine 0, 0, 800, 800
      v.drawLine 800, 0, 0, 800, 10

      pyname = 'python'
      pathName = path.join(atom.packages.getPackageDirPaths()[0], 'visualizer', 'python')
      python = spawn pyname, [path.join(pathName, 'runner.py')]
      data = ""
      python.stdout.on 'data', (chunk) ->
        data = (String.fromCharCode(c) for c in chunk).join("")
        vd = new VisualizerDraw(v, data)
        vd.printAThing()


  deactivate: ->
    @subs.dispose()
