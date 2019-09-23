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

ActiveRecord::Schema.define(version: 2019_09_23_144300) do

  create_table "answers", force: :cascade do |t|
    t.integer "quizId"
    t.string "answer"
    t.integer "answerId"
    t.integer "created_at", null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "quiz_id", null: false
    t.integer "created_at", default: 1569201292, null: false
    t.integer "updated_at", default: 1569201293, null: false
    t.integer "answerId"
    t.string "question"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "total_questions"
    t.integer "created_at", default: 1569201293, null: false
    t.integer "updated_at", default: 1569201293, null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "quizId"
    t.integer "highScore"
    t.integer "userId"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "fullName"
    t.text "bio"
    t.string "password"
    t.string "password_salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
