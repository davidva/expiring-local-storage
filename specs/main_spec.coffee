'use strict'

describe 'Main', ->

  key = 'key'

  value = { key: 'value' }

  createInstance = (spec = {}) ->
    spec.key = key
    spec.ttl = 1000 unless spec.hasOwnProperty('ttl')
    spec.defaultValue = null unless spec.hasOwnProperty('defaultValue')
    window.ExpiringLocalStorage.create(spec)

  getAndResetBehaviour = (defaultValue = null) ->

    beforeEach ->
      @data = createInstance({defaultValue:defaultValue})

    describe 'getValue', ->

      it 'returns the default value', ->
        expect(@data.getValue()).toEqual(defaultValue)

      it 'returns the stored value', ->
        @data.setValue(value)
        expect(@data.getValue()).toEqual(value)

      it 'resets its value to the default on expiration', ->
        @data.setValue(value)
        @spyDate.andReturn(date1000)
        expect(@data.getValue()).toEqual(defaultValue)

    describe 'resetValue', ->

      it 'returns the default value', ->
        @data.setValue(value)
        @data.resetValue()
        expect(@data.getValue()).toEqual(defaultValue)

  date0 = new Date(0)

  date500 = new Date(500)

  date1000 = new Date(1000)

  beforeEach ->
    @spyDate = spyOn(window, 'Date').andReturn(date0)
    window.localStorage.removeItem(key)

  describe 'without default value', ->

    getAndResetBehaviour()

  describe 'with default value', ->

    defaultValue = {elem:'default'}

    getAndResetBehaviour(defaultValue)

  describe 'setValue', ->

    value = {name:"val"}

    beforeEach ->
     @data = createInstance()

    it 'resets the expiration time', ->
      @spyDate.andReturn(date500)
      @data.setValue(value)
      @spyDate.andReturn(date1000)
      expect(@data.getValue()).toEqual(value)

    it 'shares its value between instances', ->
      @data.setValue(value)
      expect(createInstance().getValue()).toEqual(value)
