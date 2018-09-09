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

ActiveRecord::Schema.define(version: 2018_09_04_150605) do

  create_table "asignaturas", force: :cascade do |t|
    t.string "nombre"
    t.string "clave"
    t.integer "creditos"
    t.integer "universidad_id"
    t.integer "carrera_id"
    t.integer "pensum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrera_id"], name: "index_asignaturas_on_carrera_id"
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

  create_table "convalidacion_items", force: :cascade do |t|
    t.integer "convalidacion_id"
    t.integer "asignaturas_id"
    t.string "asignatura_procedencia_clave"
    t.string "asignatura_procedencia_nombre"
    t.string "asignatura_procedencia_calificacion"
    t.integer "asignatura_procedencia_creditos"
    t.string "asignatura_local_clave"
    t.string "asignatura_local_nombre"
    t.integer "asignatura_local_creditos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignaturas_id"], name: "index_convalidacion_items_on_asignaturas_id"
    t.index ["convalidacion_id"], name: "index_convalidacion_items_on_convalidacion_id"
  end

  create_table "convalidacions", force: :cascade do |t|
    t.integer "universidad_home_id"
    t.integer "universidad_procedencia_id"
    t.integer "carrera_home_id"
    t.integer "carrera_procedencia_id"
    t.integer "convalidacion_item_id"
    t.integer "estudiante_id"
    t.integer "universidad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["convalidacion_item_id"], name: "index_convalidacions_on_convalidacion_item_id"
    t.index ["estudiante_id"], name: "index_convalidacions_on_estudiante_id"
    t.index ["universidad_id"], name: "index_convalidacions_on_universidad_id"
  end

  create_table "estudiantes", force: :cascade do |t|
    t.string "nombres"
    t.string "apellidos"
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
    t.integer "asignatura_home_id"
    t.integer "asignatura_a_procedencia_id"
    t.integer "asignatura_b_procedencia_id"
    t.integer "tipo_relacion"
    t.integer "asignatura_id"
    t.integer "convalidacion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignatura_id"], name: "index_relacions_on_asignatura_id"
    t.index ["convalidacion_id"], name: "index_relacions_on_convalidacion_id"
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
