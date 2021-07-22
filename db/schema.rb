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

ActiveRecord::Schema.define(version: 2021_07_21_212312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atividades", force: :cascade do |t|
    t.string "nome_atividade", null: false
    t.date "data_inicio", null: false
    t.date "data_final", null: false
    t.boolean "finalizada", default: false
    t.bigint "projeto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["projeto_id"], name: "index_atividades_on_projeto_id"
  end

  create_table "projetos", force: :cascade do |t|
    t.string "nome_projeto", null: false
    t.date "data_inicio", null: false
    t.date "data_final", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "atividades", "projetos"
end
