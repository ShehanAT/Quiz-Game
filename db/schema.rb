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

ActiveRecord::Schema.define(version: 2019_09_28_004746) do

  create_table "answers", force: :cascade do |t|
    t.integer "quiz_id"
    t.string "answer"
    t.integer "answer_id"
    t.integer "created_at", null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "question_id", default: "f"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "quiz_id", null: false
    t.integer "created_at", default: 1569442574, null: false
    t.integer "updated_at", default: 1569442574, null: false
    t.integer "answer_id"
    t.string "question"
    t.string "question_id", default: "f"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "total_questions"
    t.integer "created_at", default: 1569442574, null: false
    t.integer "updated_at", default: 1569442574, null: false
    t.string "description"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "quizId"
    t.integer "highScore"
    t.integer "userId"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password", default: "", null: false
    t.string "fullName"
    t.string "password_salt", default: "", null: false
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
