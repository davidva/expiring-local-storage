'use strict'

window.ExpiringLocalStorage =

  create: (spec) ->

    load = () ->
      JSON.parse(window.localStorage.getItem(spec.key))

    isExpired = (data) ->
      data.lastAccess + data.ttl <= new Date().getTime()

    data = load() || {}
    data.defaultValue = spec.defaultValue || null
    data.value = data.value || data.defaultValue
    data.ttl = spec.ttl || 0
    window.localStorage.setItem(spec.key, JSON.stringify(data))

    that = {}

    that.getValue = () ->
      former = load()
      if isExpired(former)
        former.defaultValue
      else
        former.value

    that.setValue = (value) ->
      former = load()
      former.value = value
      former.lastAccess = new Date().getTime()
      window.localStorage.setItem(spec.key, JSON.stringify(former))
      that

    that.resetValue = (value) ->
      that.setValue(load().defaultValue)

    that