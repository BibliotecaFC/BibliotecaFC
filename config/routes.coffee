async = require 'async'

module.exports = (app, passport) ->

  User = require '../controllers/User'
  Login = require '../controllers/Login'
  Home = require '../controllers/Home'

  ###Ruta página principal###
  app.get '/', Home.index

  ###Rutas de Login###
  app.get '/login', Login.login
  app.post '/login', passport.authenticate('local', successRedirect: '/',failureRedirect: '/login'), Login.signin
  app.get '/logout', Login.logout

  ###Rutas para la gestion de usuarios###
  app.get '/registro', User.registro
  app.post '/registro', User.create
  app.get '/users/:userId', User.user


  ###Rutas para las conjuntas###
  Conjunta = require '../controllers/Conjunta'
  app.get '/conjuntas', Conjunta.findAllOpened
  app.get '/conjuntas/abiertas', Conjunta.findAllOpened
  app.get '/conjuntas/cerradas', Conjunta.findAllClosed
  app.get '/conjuntas/nueva', Conjunta.formNewConjunta
  app.get '/conjuntas/ultimas', Conjunta.findLatestClosed
  app.get '/conjuntas/:id', Conjunta.findById
  app.post '/conjuntas', Conjunta.addConjunta
  app.put '/conjuntas/:id', Conjunta.updateConjunta
  app.delete '/conjuntas/:id', Conjunta.deleteConjunta
  return
