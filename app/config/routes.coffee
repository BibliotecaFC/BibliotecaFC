module.exports = (app, passport) ->

  UserController = require '../controllers/UserController'
  LoginController = require '../controllers/LoginController'
  HomeController = require '../controllers/HomeController'
  ConjuntaController = require '../controllers/ConjuntaController'

  ###Ruta página principal###
  app.get '/', HomeController.index

  ###Rutas de Login###
  app.get '/login', LoginController.login
  app.post '/login', passport.authenticate('local',
    successRedirect: '/'
    failureRedirect: '/login'
    successFlash: 'Bienvenido'
    failureFlash: 'Credenciales no válidas'), LoginController.signin
  app.get '/logout', LoginController.logout

  ###Rutas para la gestion de usuarios###
  app.get '/registro', UserController.renderForm
  app.post '/registro', UserController.createUser
  app.get '/perfil', UserController.getPerfil
  app.get '/users/:user', UserController.findByUsername


  ###Rutas para las conjuntas###
  app.get '/conjuntas', ConjuntaController.findAllOpened
  app.get '/conjuntas/abiertas', ConjuntaController.findAllOpened
  app.get '/conjuntas/cerradas', ConjuntaController.findAllClosed
  app.get '/conjuntas/nueva', ConjuntaController.formNewConjunta
  app.get '/conjuntas/ultimas', ConjuntaController.findLatestClosed
  app.get '/conjuntas/:id', ConjuntaController.findById
  app.post '/conjuntas', ConjuntaController.addConjunta
  app.put '/conjuntas/:id', ConjuntaController.updateConjunta
  app.delete '/conjuntas/:id', ConjuntaController.deleteConjunta
