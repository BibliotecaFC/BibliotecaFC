HomeService = require '../services/Home/HomeService'

exports.index = (req, res) ->
  HomeService.index req, res
  return
