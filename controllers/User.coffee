mongoose = require 'mongoose'
User = require '../models/User'

login_view = 'users/login'
registro_view = 'users/registro'
conjuntas_view = 'index'
main_ruta = '/'
user_view = 'users/show'

###Registrar usuario GET###
exports.registro = (req, res) ->
  if req.user
    res.redirect main_ruta
    return
  else
    res.render registro_view,
      title: 'Registrarse'
      user: new User()
    return

###Registrar usuario POST###
exports.create = (req, res) ->
  User.register new User(email: req.body.email,nickname:req.body.nickname), req.body.password, (err, user) ->
    res.render registro_view,msg: err.message  if err
    res.render conjuntas_view,user: user
    return
  return

###Mostrar usuario GET###
exports.user = (req, res, next, id) ->
  User.findOne( _id : id).exec (err, user) ->
    return next err if err
    return next new Error('Fallo cargando el usuario ' + id) if !user
    req.profile = user
    do next
    return
  return