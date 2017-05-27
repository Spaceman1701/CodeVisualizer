HtmlView = require './html-view'

module.exports =
  class VisualizerTab
    constructor: (@tabTitle) ->
      @view = undefined

    getTitle: -> @tabTitle
    getViewClass: -> HtmlView
    setView: (view) ->
      console.log view
      @view = view
    getView: -> @view
