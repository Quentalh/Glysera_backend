# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_07_014141) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "enderecos", force: :cascade do |t|
    t.string "rua"
    t.string "cidade"
    t.string "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bairro"
    t.string "estado"
    t.string "numero"
    t.string "complemento"
  end

  create_table "equipamento_pacientes", force: :cascade do |t|
    t.date "data_de_recebimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "equipamento_id", null: false
    t.bigint "requerimento_id", null: false
    t.index ["equipamento_id"], name: "index_equipamento_pacientes_on_equipamento_id"
    t.index ["requerimento_id"], name: "index_equipamento_pacientes_on_requerimento_id"
  end

  create_table "equipamentos", force: :cascade do |t|
    t.string "marca"
    t.date "data"
    t.string "modelo"
    t.integer "numero_de_serie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observacaos", force: :cascade do |t|
    t.text "texto"
    t.date "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome"
    t.string "nome_mae"
    t.string "cpf"
    t.integer "nascimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "nascimento_date"
    t.bigint "endereco_id", null: false
    t.string "nome_social"
    t.index ["endereco_id"], name: "index_pacientes_on_endereco_id"
  end

  create_table "requerimentos", force: :cascade do |t|
    t.date "data"
    t.boolean "situacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "paciente_cpf"
    t.index ["paciente_cpf"], name: "index_requerimentos_on_paciente_cpf"
  end

  create_table "unidade_de_saudes", force: :cascade do |t|
    t.string "nome"
    t.integer "us"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "equipamento_pacientes", "equipamentos"
  add_foreign_key "equipamento_pacientes", "requerimentos"
  add_foreign_key "pacientes", "enderecos"
end
