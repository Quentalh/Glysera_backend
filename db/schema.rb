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

ActiveRecord::Schema[8.0].define(version: 2025_10_09_034512) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "rua"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipamento_pacientes", force: :cascade do |t|
    t.date "data_de_recebimento"
    t.bigint "unidade_de_saude_id", null: false
    t.bigint "paciente_id", null: false
    t.bigint "equipamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipamento_id"], name: "index_equipamento_pacientes_on_equipamento_id"
    t.index ["paciente_id"], name: "index_equipamento_pacientes_on_paciente_id"
    t.index ["unidade_de_saude_id"], name: "index_equipamento_pacientes_on_unidade_de_saude_id"
  end

  create_table "equipamentos", force: :cascade do |t|
    t.string "marca"
    t.date "data"
    t.integer "numero_de_serie"
    t.string "modelo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observacoes", force: :cascade do |t|
    t.text "texto"
    t.date "data"
    t.bigint "equipamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipamento_id"], name: "index_observacoes_on_equipamento_id"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome"
    t.string "nome_social"
    t.string "nome_mae"
    t.string "cpf"
    t.date "nascimento_date"
    t.bigint "endereco_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sexo"
    t.index ["endereco_id"], name: "index_pacientes_on_endereco_id"
  end

  create_table "requerimentos", force: :cascade do |t|
    t.date "data"
    t.boolean "situacao"
    t.bigint "paciente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_requerimentos_on_paciente_id"
  end

  create_table "unidade_de_saudes", force: :cascade do |t|
    t.string "nome"
    t.integer "us"
    t.bigint "endereco_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endereco_id"], name: "index_unidade_de_saudes_on_endereco_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome_usuario"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "equipamento_pacientes", "equipamentos"
  add_foreign_key "equipamento_pacientes", "pacientes"
  add_foreign_key "equipamento_pacientes", "unidade_de_saudes"
  add_foreign_key "observacoes", "equipamentos"
  add_foreign_key "pacientes", "enderecos"
  add_foreign_key "requerimentos", "pacientes"
  add_foreign_key "unidade_de_saudes", "enderecos"
end
