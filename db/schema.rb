# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_06_145533) do

  create_table "answers", force: :cascade do |t|
    t.string "answer"
    t.integer "created_at", null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "question_id", default: "f"
    t.integer "correct_answer"
    t.integer "quiz_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "quiz_id", null: false
    t.integer "created_at", default: 1569682240, null: false
    t.integer "updated_at", default: 1569682240, null: false
    t.string "question"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "created_at", default: 1569682240, null: false
    t.integer "updated_at", default: 1569682240, null: false
    t.string "description"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "quiz_id"
    t.integer "highScore"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password", default: "", null: false
    t.string "p_salt"
    t.string "fullName"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
