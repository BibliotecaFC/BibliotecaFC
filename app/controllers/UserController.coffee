UserService = require '../services/Users/UsersService'
Q = require 'q'

exports.createUser = (req, res) ->
  arrayDatos = new Array()
  arrayDatos = UserService.createUser req
  renderView res, arrayDatos

exports.renderForm = (req, res) ->
  arrayDatos = new Array()
  arrayDatos = UserService.renderForm req
  renderView res, arrayDatos

exports.findByUsername = (req, res) ->
  arrayDatos = new Array()
  arrayDatos = UserService.findByUsername req
  renderView res, arrayDatos

exports.getPerfil = (req, res) ->
  arrayDatos = new Array()
  user = UserService.getPerfil req
  user.then(renderView res, arrayDatos)

renderView = (res, arrayDatos) ->
  res.render arrayDatos[0], arrayDatos[1]