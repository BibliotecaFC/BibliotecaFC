config = do require '../config'
mongo = require 'mongodb'
Server = mongo.Server
Db = mongo.Db
coleccion = 'prueba'

server = new Server config.mongo.host, config.mongo.port,
  auto_reconnect: true
  safe: false
db = new Db config.mongo.bbdd, server
db.open (err, db) ->
  if !err
    console.log "Conectado"
    db.authenticate 'roto2', 'gloriaroto2',(err, res) ->
      if !err
        console.log "Autenticado: "+res
        return
    return


exports.findAllOpened = (req, res) ->
  db.collection coleccion, {safe:true},(err, collection) ->
    if !err
      collection.find({}).toArray (err, items) ->
        if !err
          res.json items
          return
    return
  return

exports.findAllClosed = (req, res) ->
  db.collection coleccion, {safe:true}, (err, collection) ->
    if !err
      collection.find({'estado':'cerrada'}).toArray (err, items) ->
        if !err
          console.log items
          res.json items
          return
    return
  return

exports.findById = (req, res) ->
  console.log req.params+" "+req.params
  return

exports.findLatestClosed = (req, res) ->
  console.log req.params+" "+req.params
  return

exports.formNewConjunta = (req, res) ->
  res.render 'conjuntas/form_nueva_conjunta',
    title: 'Nueva conjunta'
  return

exports.addConjunta = (req, res) ->
  db.collection coleccion, {safe:true}, (err, collection) ->
    if !err
      collection.insert
        nombre:req.param('nombre')
        amazon:req.param('link'),
        (err, data) ->
          if !err
            res.render 'conjuntas/nueva_conjunta',
              title: 'Nueva conjunta '+req.param('link')+' insertada'
            console.log data
            return
      return
  return

exports.updateConjunta = (req, res) ->
  console.log req.params+" "+req.params
  return

exports.deleteConjunta = (req, res) ->
  console.log req.params+" "+req.params
  return