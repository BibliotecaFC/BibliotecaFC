UserService = require '../services/Users/UsersService'

###Registrar usuario GET###
exports.renderForm = (req, res) ->
  UserService.renderForm req, res
  return

###Registrar usuario POST###
exports.createUser = (req, res) ->
  UserService.createUser req, res
  return

###Mostrar usuario GET###
exports.findByUsername = (req, res) ->
  UserService.findByUsername req, res
  return