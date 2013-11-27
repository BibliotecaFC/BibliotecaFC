// Generated by CoffeeScript 1.6.3
(function() {
  var UserService;

  UserService = require('../services/Users/UsersService');

  exports.renderForm = function(req, res) {
    return UserService.renderForm(req, res);
  };

  exports.createUser = function(req, res) {
    return UserService.createUser(req, res);
  };

  exports.findByUsername = function(req, res) {
    return UserService.findByUsername(req, res);
  };

}).call(this);
