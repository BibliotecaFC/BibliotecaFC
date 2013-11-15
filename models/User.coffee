mongoose = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'
Conjunta = require '../models/Conjunta'

Schema = mongoose.Schema

User = new Schema(
  nickname: String
  admin: type: Boolean, default: false
  updated: type: Date, default: Date.now
  conjuntas: [type: Schema.Types.ObjectId, ref: 'Conjunta']
)

User.plugin passportLocalMongoose,
  usernameField: "email"
  incorrectPasswordError: "Contraseña erronea"
  incorrectUsernameError: "Nombre de usuario incorrecto"
  missingUsernameError: "Nombre de usuario vacio"
  missingPasswordError: "Contraseña vacia"
  userExistsError: "El usuario ya existe"

module.exports = mongoose.model 'User', User