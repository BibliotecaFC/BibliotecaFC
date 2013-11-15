// Generated by CoffeeScript 1.6.3
(function() {
  var User, conjuntas_view, login_view, mongoose, registro_view, user_view;

  mongoose = require('mongoose');

  User = require('../models/User');

  login_view = 'users/login';

  registro_view = 'users/registro';

  conjuntas_view = '/';

  user_view = 'users/show';

  /*Login POST*/


  exports.signin = function(req, res) {
    res.redirect('/');
  };

  /*Login GET*/


  exports.login = function(req, res) {
    if (req.user) {
      res.redirect(conjuntas_view);
    } else {
      res.render(login_view, {
        title: 'Login',
        message: req.flash('error'),
        user: req.user
      });
    }
  };

  /*Logout GET*/


  exports.logout = function(req, res) {
    req.logout();
    res.redirect('login');
  };

}).call(this);
