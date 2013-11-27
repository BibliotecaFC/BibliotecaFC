UserService = require '../services/Users/UsersService'

exports.renderForm = (req, res) ->
  UserService.renderForm req, res

exports.createUser = (req, res) ->
  UserService.createUser req, res

exports.findByUsername = (req, res) ->
  UserService.findByUsername req, res