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

ActiveRecord::Schema.define(version: 2018_08_22_193610) do

  create_table "asignaturas", force: :cascade do |t|
    t.string "nombre"
    t.string "clave"
    t.integer "creditos"
    t.integer "universidad_id"
    t.integer "pensum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pensum_id"], name: "index_asignaturas_on_pensum_id"
    t.index ["universidad_id"], name: "index_asignaturas_on_universidad_id"
  end

  create_table "carreras", force: :cascade do |t|
    t.string "nombre"
    t.integer "universidad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["universidad_id"], name: "index_carreras_on_universidad_id"
  end

  create_table "convalidacions", force: :cascade do |t|
    t.boolean "convalida"
    t.integer "asignatura_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignatura_id"], name: "index_convalidacions_on_asignatura_id"
  end

  create_table "estudiantes", force: :cascade do |t|
    t.string "nombre"
    t.string "matricula"
    t.string "correo"
    t.string "telefono"
    t.integer "persona_id"
    t.integer "carrera_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrera_id"], name: "index_estudiantes_on_carrera_id"
    t.index ["persona_id"], name: "index_estudiantes_on_persona_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pensums", force: :cascade do |t|
    t.string "nombre"
    t.date "date"
    t.integer "carrera_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrera_id"], name: "index_pensums_on_carrera_id"
  end

  create_table "personas", force: :cascade do |t|
    t.integer "tipo"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relacions", force: :cascade do |t|
    t.integer "asignatura_home"
    t.integer "asignatura_proc"
    t.integer "asignatura_proc_extra"
    t.integer "asignatura_id"
    t.boolean "convalida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignatura_id"], name: "index_relacions_on_asignatura_id"
  end

  create_table "universidads", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
