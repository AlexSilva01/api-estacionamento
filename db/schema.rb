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

ActiveRecord::Schema.define(version: 2021_11_24_171549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "historico_entrada_saidas", force: :cascade do |t|
    t.bigint "veiculo_id", null: false
    t.datetime "dataEntrada"
    t.datetime "dataSaida"
    t.boolean "isEntrada"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["veiculo_id"], name: "index_historico_entrada_saidas_on_veiculo_id"
  end

  create_table "movimentacao_veiculos", force: :cascade do |t|
    t.bigint "historico_entrada_saidas_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["historico_entrada_saidas_id"], name: "index_movimentacao_veiculos_on_historico_entrada_saidas_id"
  end

  create_table "proprietarios", force: :cascade do |t|
    t.string "nome"
    t.integer "bloco"
    t.integer "apartamento"
    t.boolean "morador"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "veiculos", force: :cascade do |t|
    t.bigint "proprietario_id", null: false
    t.string "placa"
    t.string "cor"
    t.string "modelo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proprietario_id"], name: "index_veiculos_on_proprietario_id"
  end

  add_foreign_key "historico_entrada_saidas", "veiculos"
  add_foreign_key "movimentacao_veiculos", "historico_entrada_saidas", column: "historico_entrada_saidas_id"
  add_foreign_key "veiculos", "proprietarios"
end
