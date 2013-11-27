UserModel = require '../../models/UserModel'
LoginService = require '../Login/LoginService'

main_ruta = '/'

login_view = 'users/login'
registro_view = 'users/registro'
user_view = 'users/show'
conjuntas_view = 'index'

password_not_match = 'Las contraseñas no coinciden'

exports.createUser = (req, res)->
  if req.body.repeat_password isnt req.body.password
    res.render registro_view,msg:password_not_match
  else
    UserModel.register new UserModel(email: req.body.email,nickname:req.body.nickname), req.body.password, (err, user) ->
      res.render registro_view,msg: err.message  if err
      res.render conjuntas_view,user: user if user

exports.renderForm = (req, res) ->
  activo = LoginService.isLogged req
  if activo is true
    res.redirect main_ruta
  else
    res.render registro_view,
      title: 'Registrarse'
      user: new UserModel()

exports.findByUsername = (req, res) ->
  UserModel.findByUsername req.params.user, (err, user) ->
    res.render conjuntas_view if err
    res.render conjuntas_view,user: user if user





