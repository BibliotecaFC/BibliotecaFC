UserModel = require '../../models/UserModel'
LoginService = require '../Login/LoginService'
Q = require 'q'

conjuntas_view = 'index'

login_view = 'users/login'
registro_view = 'users/registro'
user_view = 'users/show'
perfil_view = 'users/perfil'

password_not_match = 'Las contraseñas no coinciden'

exports.createUser = (req)->
  arrayDatos = new Array()
  if req.body.repeat_password isnt req.body.password
    arrayDatos.push registro_view
    arrayDatos.push msg:password_not_match
    arrayDatos
  else
    UserModel.register new UserModel(email: req.body.email,nickname:req.body.nickname), req.body.password, (err, user) ->
      if err
        vista = registro_view
        datos = msg: err.message
      if user
        vista = conjuntas_view
        datos = user: user
      arrayDatos.push vista
      arrayDatos.push datos
      arrayDatos

exports.renderForm = (req) ->
  activo = LoginService.isLogged req
  arrayDatos = new Array()
  if activo is true
    vista = conjuntas_view
    datos = {}
  else
    vista = registro_view
    datos =
      title: 'Registrarse'
      user: new UserModel()
  arrayDatos.push vista
  arrayDatos.push datos
  arrayDatos

exports.getPerfil = (req) ->
  arrayDatos = new Array()
  UserModel.findByUsername req.user.email, (err, user) ->
    datos = {} if err
    datos = user: user if user
    arrayDatos.push perfil_view
    arrayDatos.push datos
    arrayDatos

exports.findByUsername = (req) ->
  arrayDatos = new Array()
  UserModel.findByUsername req.params.user, (err, user) ->
    datos = {} if err
    datos = user: user if user
    arrayDatos.push conjuntas_view
    arrayDatos.push datos
    arrayDatos




