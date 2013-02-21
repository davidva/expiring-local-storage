'use strict'

class window.ExpiringLocalStorageData

  constructor: (@key) ->
  	@value = @defaultValue
  	@resetTimestamp()

  getKey: ->
    @key

  getLastAccess: ->
  	@timestamp

  getValue: ->
  	if @isExpired()
  	  @reset()
    @value

  setValue: (value) ->
    @resetTimestamp()
    @value = value
    @

  reset: ->
    @setValue(@defaultValue)

  setDefaultValue: (defaultValue) ->
    if @value == @defaultValue
      @setValue(defaultValue)
    @defaultValue = defaultValue
    @

  resetTimestamp: ->
  	@timestamp = new Date().getTime()

  setTtl: (@ttl) -> @

  isExpired: ->
    @ttl? and new Date().getTime() >= @timestamp + @ttl
