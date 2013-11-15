// Generated by CoffeeScript 1.6.3
(function() {
  var UserService;

  UserService = require('../services/Users/UsersService');

  /*Registrar usuario GET*/


  exports.renderForm = function(req, res) {
    UserService.renderForm(req, res);
  };

  /*Registrar usuario POST*/


  exports.createUser = function(req, res) {
    UserService.createUser(req, res);
  };

  /*Mostrar usuario GET*/


  exports.findById = function(req, res, next, id) {
    UserService.findById(req, res, next, id);
  };

}).call(this);
