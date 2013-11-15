mongoose = require 'mongoose'
UserModel = require '../models/UserModel'

module.exports = (passport) ->
  passport.use do UserModel.createStrategy
  passport.serializeUser do UserModel.serializeUser
  passport.deserializeUser do UserModel.deserializeUser
  return


