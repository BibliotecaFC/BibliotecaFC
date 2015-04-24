HomeService = require '../services/Home/HomeService'

exports.index = (req, res) ->
  console.log req
  datosVista = new Array()
  datosVista = HomeService.index req
  res.render datosVista[0], datosVista[1]
