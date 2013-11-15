mongoose = require 'mongoose'
User = require '../models/User'

Schema = mongoose.Schema

ConjuntaSchema = new Schema(
  titulo: String
  imagen: String
  link_tienda: String
  link_fc: String
  abierta: type: Boolean, default: true
  numero_compradores: Number
  usuarios: [type: Schema.Types.ObjectId, ref:'User']
)

mongoose.model 'Conjunta', ConjuntaSchema