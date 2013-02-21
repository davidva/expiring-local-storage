'use strict'

describe 'Main', ->

  beforeEach ->
    @key = 'key'
    @data = new window.ExpiringLocalStorageData(@key)

  it 'stores the key', ->
    expect(@data.getKey()).toBe(@key)

  it 'saves strings', ->
    value = 'value'
    @data.setValue(value)

    expect(@data.getValue(@key)).toBe(value)

  it 'has undefined as default value', ->
    expect(@data.getValue()).toBeUndefined()

  it 'can be reset', ->
    @data.setValue('value')
    @data.reset()
    expect(@data.getValue()).toBeUndefined()

  describe 'default value', ->

    beforeEach ->
      @defaultValue = 'default value'
      @data.setDefaultValue(@defaultValue)

    it 'updates the value if it is the former default', ->
      expect(@data.getValue()).toBe(@defaultValue)

    it 'keeps the previous value if it is not the former default', ->
      value = 'value'
      @data.setValue(value).setDefaultValue(undefined)

      expect(@data.getValue()).toBe(value)

    it 'sets default value after reset', ->
      @data.setValue('non default value')

      @data.reset()

      expect(@data.getValue()).toBe(@defaultValue)

  describe 'expiring time', ->

    beforeEach ->
      @firstTime = 648063000000
      ttl = 3600000
      @futureTime = @firstTime + ttl
      @futureDate = new Date(@futureTime)

      creationDate = new Date(@firstTime)
      @spy = spyOn(window, 'Date').andReturn(creationDate)
      @data = new window.ExpiringLocalStorageData(@key).setTtl(ttl)

    it 'stores creation time as last access time', ->
      expect(@data.getLastAccess()).toBe(@firstTime)

    it 'updates last access when changing its value', ->
      window.Date.andReturn(@futureDate)

      @data.setValue('dummy')

      expect(@data.getLastAccess()).toBe(@futureTime)

    it 'returns default value after expiration', ->
      @data.setValue('dummy value')

      window.Date.andReturn(@futureDate)

      expect(@data.getValue()).toBeUndefined()
