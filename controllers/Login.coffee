mongoose = require 'mongoose'
User = require '../models/User'

login_view = 'users/login'
registro_view = 'users/registro'
conjuntas_view = '/'
user_view = 'users/show'

###Login POST###
exports.signin = (req, res) ->
  res.redirect('/');
  return

###Login GET###
exports.login = (req, res) ->
  if req.user
    res.redirect conjuntas_view
    return
  else
    res.render login_view,
      title: 'Login'
      message: req.flash 'error'
      user: req.user
    return

###Logout GET###
exports.logout = (req, res) ->
  do req.logout
  res.redirect 'login'
  return