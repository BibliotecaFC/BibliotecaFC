module.exports = (app, passport) ->

  UserController = require '../controllers/UserController'
  LoginController = require '../controllers/LoginController'
  HomeController = require '../controllers/HomeController'
  ConjuntaController = require '../controllers/ConjuntaController'

  ###Ruta página principal###
  app.route.get '/', HomeController.index

  ###Rutas de Login###
  app.route.get '/login', LoginController.login
  app.route.post '/login', passport.authenticate('local',
    successRedirect: '/'
    failureRedirect: '/login'
    successFlash: 'Bienvenido'
    failureFlash: 'Credenciales no válidas'), LoginController.signin
  app.route.get '/logout', LoginController.logout

  ###Rutas para la gestion de usuarios###
  app.route.get '/registro', UserController.renderForm
  app.route.post '/registro', UserController.createUser
  app.route.get '/perfil', UserController.getPerfil
  app.route.get '/users/:user', UserController.findByUsername


  ###Rutas para las conjuntas###
  app.route.get '/conjuntas', ConjuntaController.findAllOpened
  app.route.get '/conjuntas/abiertas', ConjuntaController.findAllOpened
  app.route.get '/conjuntas/cerradas', ConjuntaController.findAllClosed
  app.route.get '/conjuntas/nueva', ConjuntaController.formNewConjunta
  app.route.get '/conjuntas/ultimas', ConjuntaController.findLatestClosed
  app.route.get '/conjuntas/:id', ConjuntaController.findById
  app.route.post '/conjuntas', ConjuntaController.addConjunta
  app.route.put '/conjuntas/:id', ConjuntaController.updateConjunta
  app.route.delete '/conjuntas/:id', ConjuntaController.deleteConjunta
