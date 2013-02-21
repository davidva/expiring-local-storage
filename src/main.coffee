'use strict'

class window.ExpiringLocalStorageData

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
