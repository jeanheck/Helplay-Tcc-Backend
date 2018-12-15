# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180910194627) do

  create_table "amigos", force: :cascade do |t|
    t.integer "usuarioUm_id"
    t.integer "usuarioDois_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuarioDois_id"], name: "index_amigos_on_usuarioDois_id"
    t.index ["usuarioUm_id"], name: "index_amigos_on_usuarioUm_id"
  end

  create_table "atividades", force: :cascade do |t|
    t.integer "esporte_id"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["esporte_id"], name: "index_atividades_on_esporte_id"
    t.index ["usuario_id"], name: "index_atividades_on_usuario_id"
  end

  create_table "caracteristicas", force: :cascade do |t|
    t.string "descricao"
    t.integer "esporte_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "inseridaPeloUsuario"
    t.index ["esporte_id"], name: "index_caracteristicas_on_esporte_id"
  end

  create_table "esportes", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string "descricao"
    t.string "local"
    t.datetime "dataHora"
    t.text "informacoes"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "publico"
    t.index ["usuario_id"], name: "index_eventos_on_usuario_id"
  end

  create_table "individualidades", force: :cascade do |t|
    t.integer "atividade_id"
    t.integer "caracteristica_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atividade_id"], name: "index_individualidades_on_atividade_id"
    t.index ["caracteristica_id"], name: "index_individualidades_on_caracteristica_id"
  end

  create_table "participantes", force: :cascade do |t|
    t.integer "evento_id"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_participantes_on_evento_id"
    t.index ["usuario_id"], name: "index_participantes_on_usuario_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.date "dataNascimento"
    t.string "sexo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "celular"
    t.index ["user_id"], name: "index_usuarios_on_user_id"
  end

end
