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

      pyname = 'python'
      pathName = path.join(atom.packages.getPackageDirPaths()[0], 'visualizer', 'python')
      python = spawn pyname, [path.join(pathName, 'runner.py')]
      python.stdin.write(path.join(pathName, 'parser.py') + '\n')
      python.stdin.write('x = 2; //and other code \n')
      data = ""
      python.stdout.on 'data', (chunk) ->
        data = (String.fromCharCode(c) for c in chunk).join("")
        vd = new VisualizerDraw(v, data)
      python.stderr.on 'data', (chunk) ->
        console.error  (String.fromCharCode(c) for c in chunk).join("")


  deactivate: ->
    @subs.dispose()
