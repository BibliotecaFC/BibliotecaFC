// Generated by CoffeeScript 1.6.3
(function() {
  var app, config, env, exports, express, fs, models_dir, mongoose, newrelic, passport, port;

  newrelic = require('newrelic');

  express = require('express');

  passport = require('passport');

  mongoose = require('mongoose');

  fs = require('fs');

  env = process.env.NODE_ENV || 'pre';

  config = require('./config/config')[env];

  mongoose.connect(config.db);

  models_dir = __dirname + '/models';

  fs.readdirSync(models_dir).forEach(function(file) {
    if (file[0] === '.' || file.indexOf('coffee') > 0) {
      return;
    }
    require(models_dir + '/' + file);
  });

  require('./config/passport')(passport);

  app = express();

  require('./config/express')(app, config, passport);

  require('./config/routes')(app, passport);

  port = process.env.PORT || 3000;

  app.listen(port);

  console.log('Servidor express escuchando en el puerto: ' + port);

  exports = module.exports = app;

}).call(this);