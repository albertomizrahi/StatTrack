# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130513022649) do

  create_table "basketball_stats", :force => true do |t|
    t.date     "date_played_on"
    t.string   "opponent"
    t.integer  "time_played_in_seconds"
    t.integer  "field_goals_made"
    t.integer  "field_goals_attempted"
    t.integer  "threepts_made"
    t.integer  "threepts_attempted"
    t.integer  "free_throws_made"
    t.integer  "free_throws_attempted"
    t.integer  "offensive_rebounds"
    t.integer  "defensive_rebounds"
    t.integer  "total_rebounds"
    t.integer  "assists"
    t.integer  "turnovers"
    t.integer  "steals"
    t.integer  "blocks"
    t.integer  "personal_fouls"
    t.decimal  "field_goal_percentage"
    t.decimal  "threept_percentage"
    t.decimal  "free_throw_percentage"
    t.integer  "total_points"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "basketball_stats", ["user_id"], :name => "index_basketball_stats_on_user_id"

  create_table "football_defense_stats", :force => true do |t|
    t.date     "date_played_on"
    t.string   "opponent"
    t.integer  "solo_tackles"
    t.integer  "total_tackles"
    t.integer  "assisted_tackles"
    t.decimal  "sacks"
    t.integer  "stuffs"
    t.integer  "stuff_yards"
    t.integer  "forced_fumbles"
    t.integer  "fumbles_recovered"
    t.integer  "fumbles_returned_for_touchdown"
    t.integer  "kicks_blocked"
    t.integer  "interceptions"
    t.integer  "intercepted_returned_yards"
    t.decimal  "average_intercepted_return_yards"
    t.integer  "longest_interception_return"
    t.integer  "interceptions_returned_for_touchdown"
    t.integer  "passes_defended"
    t.integer  "safeties"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "football_defense_stats", ["user_id"], :name => "index_football_defense_stats_on_user_id"

  create_table "football_quarterback_stats", :force => true do |t|
    t.date     "date_played_on"
    t.string   "opponent"
    t.integer  "completions"
    t.integer  "passing_attempts"
    t.decimal  "completion_percentage"
    t.integer  "passing_yards"
    t.decimal  "yards_per_attempt"
    t.integer  "passing_touchdowns"
    t.integer  "interceptions"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "fumbles"
    t.integer  "rushing_touchdowns"
    t.decimal  "yards_per_rush"
    t.decimal  "quarterback_rating"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "football_quarterback_stats", ["user_id"], :name => "index_football_quarterback_stats_on_user_id"

  create_table "football_receiver_stats", :force => true do |t|
    t.date     "date_played_on"
    t.string   "opponent"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.decimal  "rushing_average"
    t.integer  "longest_run"
    t.integer  "rushing_touchdowns"
    t.integer  "receptions"
    t.integer  "reception_targets"
    t.integer  "receiving_yards"
    t.decimal  "receiving_average"
    t.integer  "longest_reception"
    t.integer  "receiving_touchdowns"
    t.integer  "fumbles"
    t.integer  "fumbles_lost"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "football_receiver_stats", ["user_id"], :name => "index_football_receiver_stats_on_user_id"

  create_table "football_runningback_stats", :force => true do |t|
    t.date     "date_played_on"
    t.string   "opponent"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.decimal  "rushing_average"
    t.integer  "longest_run"
    t.integer  "rushing_touchdowns"
    t.integer  "receptions"
    t.integer  "receiving_yards"
    t.decimal  "receiving_average"
    t.integer  "longest_reception"
    t.integer  "receiving_touchdowns"
    t.integer  "fumbles"
    t.integer  "fumbles_lost"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "football_runningback_stats", ["user_id"], :name => "index_football_runningback_stats_on_user_id"

  create_table "sportizations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sport_id"
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sportizations", ["sport_id"], :name => "index_sportizations_on_sport_id"
  add_index "sportizations", ["user_id", "sport_id", "position"], :name => "index_sportizations_on_user_id_and_sport_id_and_position", :unique => true
  add_index "sportizations", ["user_id"], :name => "index_sportizations_on_user_id"

  create_table "sports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.date     "birthday"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
