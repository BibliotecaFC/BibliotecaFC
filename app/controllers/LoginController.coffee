LoginService = require '../services/Login/LoginService'

exports.signin = (req, res) ->
  vista = LoginService.signin
  res.redirect vista

exports.login = (req, res) ->
  arrayDatos = new Array
  arrayDatos = LoginService.login req
  if arrayDatos[0] is 'redirect'
    res.redirect arrayDatos[1]
  else
    res.render arrayDatos[1], arrayDatos[2]

exports.logout = (req, res) ->
  vista = LoginService.logout req
  res.redirect vista