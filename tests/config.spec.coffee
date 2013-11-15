describe "Configuration Setup", ->
  it "Debe cargar configuracion para entorno de desarrollo", (next) ->
    config = do require '.'
    expect(config.mode).toBe 'dev'
    do next
  it "Debe cargar configuracion para entorno PRE", (next) ->
    expect(config.mode).toBe 'pre'
    config = require('.') 'pre'
    do next
  it "Debe cargar configuracion para entorno PRO", (next) ->
    expect(config.mode).toBe 'pro'
    config = require('.') 'pro'
    do next