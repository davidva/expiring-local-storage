'use strict'

class window.ExpiryLocalStorageData

  constructor: (@key) ->

  getKey: ->
    @key

  getValue: ->
    @value

  setValue: (value) ->
    @value = value

  reset: ->
    @value = undefined
