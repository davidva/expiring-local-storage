'use strict'

class window.ExpiryLocalStorageData

  constructor: (@key, @default = undefined) ->
  	@value = @default

  getKey: ->
    @key

  getValue: ->
    @value

  setValue: (value) ->
    @value = value

  reset: ->
    @value = @default
