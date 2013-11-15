ConjuntasSerive = require '../services/Conjuntas/ConjuntasService'

exports.findAllOpened = (req, res) ->
  ConjuntasSerive.findAllOpened req, res
  return

exports.findAllClosed = (req, res) ->
  ConjuntasSerive.findAllClosed req, res
  return

exports.findById = (req, res) ->
  ConjuntasSerive.findById req, res
  return

exports.findLatestClosed = (req, res) ->
  ConjuntasSerive.findLatestClosed req, res
  return

exports.formNewConjunta = (req, res) ->
  ConjuntasSerive.formNewConjunta req, res
  return

exports.addConjunta = (req, res) ->
  ConjuntasSerive.addConjunta req, res
  return

exports.updateConjunta = (req, res) ->
  ConjuntasSerive.updateConjunta req, res
  return

exports.deleteConjunta = (req, res) ->
  ConjuntasSerive.deleteConjunta req, res
  return