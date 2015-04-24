expressSession = require 'express-session'
cookieParser = require 'cookie-parser'
flash = require 'connect-flash'
mongoStore = require('connect-mongo') expressSession

module.exports = (app, config) ->
  app.use cookieParser('bfc')
  app.use expressSession(
    secret: 'bibliotecafc',
    resave: false,
    saveUninitialized: false,
    store: new mongoStore
      url: config.db
      collection : 'sessions'
  )
  app.use do flash