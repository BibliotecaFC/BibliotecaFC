express = require 'express'
expressSession = require 'express-session'
cookieParser = require 'cookie-parser'
methodOverride = require 'method-override'
bodyParser = require 'body-parser'
compression = require 'compression'
favicon = require 'serve-favicon'
serveStatic = require 'serve-static'
morgan = require 'morgan'
mongoStore = require('connect-mongo') expressSession
flash = require 'connect-flash'
helpers = require 'view-helpers'

module.exports = (app, config, passport) ->
  app.set 'showStackError', true
  app.use compression(
    filter: (req, res) ->
      return /json|text|javascript|css/.test res.getHeader('Content-Type'),
    level: 9
  )
  app.use do favicon
  app.use serveStatic(config.root + '/public')
  app.use(morgan 'dev') if process.env.NODE_ENV isnt 'test'
  app.set 'views', config.root + '/views'
  app.set 'view engine', 'jade'
  app.configure(->
    app.use(helpers config.app.name)
    app.use cookieParser('bfc')
    app.use do bodyParser.json
    app.use do bodyParser.urlencoded
    app.use do methodOverride
    app.use expressSession(
      secret: 'bibliotecafc',
      store: new mongoStore
        url: config.db
        collection : 'sessions'
    )
    app.use do flash
    app.use do passport.initialize
    app.use do passport.session
    app.use app.router

    app.use (err, req, res, next) ->
      return do next if ~err.message.indexOf 'not found'
      res.status(500).render '500', error: err.stack
      return
    app.use (req, res, next) ->
      res.status(404).render '404', url: req.originalUrl, error: 'Not found'
      return
    return
  )
  return