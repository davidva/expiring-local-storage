'use strict'

describe 'Main', ->

  beforeEach ->
    @key = 'key'
    @data = new window.ExpiryLocalStorageData(@key)

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
