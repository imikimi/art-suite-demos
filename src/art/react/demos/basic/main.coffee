{log} = Foundation = require "art.foundation"
{
  createAndInstantiateTopComponent
  CanvasElement
  Element
  Rectangle
  TextElement
} = require "art.react"
{point} = require "art.atomic"

module.exports = ->
  createAndInstantiateTopComponent

    getInitialState: ->
      text: "Love"
      clr: "pink"
      handlers:
        pointerDown: @pointerDown
        pointerUp:   @pointerUp

    pointerDown:  -> @setState text: "and War",  clr: "red"
    pointerUp:    -> @setState text: "Love",     clr: "pink"

    render: ->
      {text, handlers, clr} = @state
      CanvasElement
        canvasId: "artCanvas"
        on:       handlers

        Rectangle color: "pink", animate: to: color: clr

        TextElement
          key: text
          location: ps: .5
          addedAnimation: from: opacity: 0, axis: point 1, .5
          removedAnimation: to: opacity: 0, axis: point 0, .5
          axis:     .5
          text:     text
          color:    "white"
          fontSize: 50
