mongoose = require 'mongoose'
User = require './UserModel'

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

module.exports = mongoose.model 'Conjunta', ConjuntaSchema