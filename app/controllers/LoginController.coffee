LoginService = require '../services/Login/LoginService'

###Login POST###
exports.signin = (req, res) ->
  LoginService.signin req, res
  return

###Login GET###
exports.login = (req, res) ->
  LoginService.login req, res
  return

###Logout GET###
exports.logout = (req, res) ->
  LoginService.logout req, res
  return