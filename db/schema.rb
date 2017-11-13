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

ActiveRecord::Schema.define(version: 20171112220810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ejercicios", force: :cascade do |t|
    t.string "nombre"
    t.string "musculo"
    t.string "gif"
    t.string "maquina"
    t.string "repeticiones"
    t.string "tiempo"
    t.string "series"
    t.bigint "rutina_id"
    t.string "peso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rutina_id"], name: "index_ejercicios_on_rutina_id"
  end

  create_table "entrenadors", force: :cascade do |t|
    t.string "nombre"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rutinas", force: :cascade do |t|
    t.string "tipo"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_rutinas_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nombre"
    t.string "password"
    t.bigint "entrenador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entrenador_id"], name: "index_usuarios_on_entrenador_id"
  end

  add_foreign_key "ejercicios", "rutinas"
  add_foreign_key "rutinas", "usuarios"
  add_foreign_key "usuarios", "entrenadors"
end
