mongoose = require 'mongoose'
LocalStrategy = require('passport-local').Strategy
User = mongoose.model 'User'

module.exports = (passport) ->

  passport.use do User.createStrategy

  passport.serializeUser do User.serializeUser
  passport.deserializeUser do User.deserializeUser

  return


