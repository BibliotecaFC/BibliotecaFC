mongoose = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'
COnjunta = require './ConjuntaModel'

Schema = mongoose.Schema

UserSchema = new Schema(
  nickname: String
  admin: type: Boolean, default: false
  updated: type: Date, default: Date.now
  active: type: Boolean, default: false
  conjuntas: [type: Schema.Types.ObjectId, ref: 'COnjunta']
)

UserSchema.plugin passportLocalMongoose,
  usernameField: "email"
  incorrectPasswordError: "Contraseña erronea"
  incorrectUsernameError: "Nombre de usuario incorrecto"
  missingUsernameError: "Nombre de usuario vacio"
  missingPasswordError: "Contraseña vacia"
  userExistsError: "El usuario ya existe"

module.exports = mongoose.model 'User', UserSchema