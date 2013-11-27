login_view = 'users/login'
conjuntas_page = '/'
login_page = 'login'

exports.signin = ->
  conjuntas_page

exports.login = (req) ->
  activo = this.isLogged req
  arrayDatos = new Array()
  modo = selectMode req, activo
  vista = selectView activo
  datos = selectDatos req, activo
  arrayDatos.push modo
  arrayDatos.push vista
  arrayDatos.push datos
  arrayDatos

exports.logout = (req) ->
  do req.logout
  login_page

exports.isLogged = (req) ->
  req.user and req.user.active is true

selectView = (activo) ->
  if activo is true
    conjuntas_page
  else
    login_view

selectDatos = (req, activo) ->
  if activo is true
    datos =
      title: 'Login'
  else
    datos =
      title: 'Login'
      message: req.flash 'Error'
      user: req.user
  datos

selectMode = (req, activo) ->
  if activo is true
    'redirect'
  else
    'render'