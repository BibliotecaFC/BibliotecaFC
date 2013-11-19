login_view = 'users/login'
conjuntas_view = '/'

###Login POST###
exports.signin = (req, res) ->
  res.redirect('/');
  return

###Login GET###
exports.login = (req, res) ->
  if req.user and req.user.active is true
    res.redirect conjuntas_view
    return
  else
    res.render login_view,
      title: 'Login'
      message: req.flash 'Error'
      user: req.user
    return

###Logout GET###
exports.logout = (req, res) ->
  do req.logout
  res.redirect 'login'
  return

exports.isLogged = (req, res) ->
  req.user and req.user.active is true

