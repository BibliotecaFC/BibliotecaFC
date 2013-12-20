newrelic = require 'newrelic'
express = require 'express'
passport = require 'passport'
mongoose = require 'mongoose'
fs = require 'fs'
env = process.env.NODE_ENV or 'pre'
config = require('./config/config')[env]

mongoose.connect config.db

models_dir = __dirname + '/models'

fs.readdirSync(models_dir).forEach (file) ->
  if file[0] is '.' or file.indexOf('coffee') > 0
    return
  require models_dir+'/'+ file

app = do express

require('./config/passport') passport

require('./config/express') app, config, passport

require('./config/routes') app, passport

port = process.env.PORT or 3000
app.listen port
console.log('Servidor express escuchando en el puerto: '+port);

exports = module.exports = app



