conjuntas_view = 'index'
login_view = 'users/login'

exports.index = (req, res) ->
  if req.user and req.user.active is true
    res.render conjuntas_view,
      title: 'Passport Setup'
      user: req.user
    return
  else
    res.render login_view,
      title: 'Login'
      message: req.flash 'error'
      user: req.user
    return
