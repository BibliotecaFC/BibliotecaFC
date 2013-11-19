UserModel = require '../../models/UserModel'

###Rutas###
main_ruta = '/'
###Vistas###
login_view = 'users/login'
registro_view = 'users/registro'
conjuntas_view = 'index'
user_view = '../users/show'

exports.createUser = (req, res)->
  console.log req.body.repeat_password is req.body.password
  if req.body.repeat_password isnt req.body.password
    res.render registro_view,msg:'Las contraseñas no coinciden'
  else
    UserModel.register new UserModel(email: req.body.email,nickname:req.body.nickname), req.body.password, (err, user) ->
      res.render registro_view,msg: err.message  if err
      res.render conjuntas_view,user: user if user
      return
  return

exports.renderForm = (req, res) ->
  if req.user and req.user.active is true
    res.redirect main_ruta
  else
    res.render registro_view,
      title: 'Registrarse'
      user: new UserModel()
  return

exports.findByUsername = (req, res) ->
  UserModel.findByUsername req.params.user, (err, user) ->
    res.render conjuntas_view if err
    res.render conjuntas_view,user: user if user
    return
  return






