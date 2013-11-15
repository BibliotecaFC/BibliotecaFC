path = require 'path'
rootPath = path.normalize __dirname + '/..'

module.exports =
  development:
    db: ''
    root: rootPath
    app:
      name: 'DEV Biblioteca FC'
  pre:
    db: 'mongodb://roto2:gloriaroto2@ds053808.mongolab.com:53808/bibiliotecafc_pre'
    root: rootPath
    app:
      name: 'PRE Biblioteca FC'
  pro:
    db: 'mongodb://roto2:gloriaroto2@ds053128.mongolab.com:53128/heroku_app19057649'
    root: rootPath
    app:
      name: 'Biblioteca FC'