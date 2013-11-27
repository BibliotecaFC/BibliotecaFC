LoginService = require '../Login/LoginService'

conjuntas_view = 'index'
login_view = 'users/login'

exports.index = (req) ->
  activo = LoginService.isLogged req
  arrayDatos = new Array()
  vista = selectView activo
  datos = selectData req, activo
  arrayDatos.push vista
  arrayDatos.push datos
  arrayDatos

selectView = (activo) ->
  if activo is true
    conjuntas_view
  else
    login_view

selectData = (req, activo) ->
  if activo is true
    datos =
      title: 'Passport Setup'
      user: req.user
  else
    datos =
      title: 'Login'
      message: req.flash 'error'
      user: req.user
  datos