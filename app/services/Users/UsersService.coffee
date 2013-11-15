UserModel = require '../../models/UserModel'

###Rutas###
main_ruta = '/'
###Vistas###
login_view = 'users/login'
registro_view = 'users/registro'
conjuntas_view = 'index'
user_view = '../users/show'

exports.createUser = (req, res)->
  UserModel.register new UserModel(email: req.body.email,nickname:req.body.nickname), req.body.password, (err, user) ->
    res.render registro_view,msg: err.message  if err
    res.render conjuntas_view,user: user if user
    return
  return

exports.renderForm = (req, res) ->
  if req.user
    res.redirect main_ruta
  else
    res.render registro_view,
    title: 'Registrarse'
    user: new UserModel()
  return

exports.findByID = ->
  UserModel.findOne( _id : id).exec (err, user) ->
    return next err if err
    return next new Error('Fallo cargando el usuario ' + id) if !user
    req.profile = user
    do next
    return
  return






