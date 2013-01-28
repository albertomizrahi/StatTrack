class CreateFootballQuarterbackStats < ActiveRecord::Migration
  def change
    create_table :football_quarterback_stats do |t|
      t.date :date_played_on
      t.string :opponent
      t.integer :completions
      t.integer :passing_attempts
      t.decimal :completion_percentage
      t.integer :passing_yards
      t.decimal :yards_per_attempt
      t.integer :passing_touchdowns
      t.integer :interceptions
      t.integer :rushing_attempts
      t.integer :rushing_yards
      t.integer :fumbles
      t.integer :rushing_touchdowns
      t.decimal :yards_per_rush
      t.decimal :quarterback_rating
      t.references :user

      t.timestamps
    end
    add_index :football_quarterback_stats, :user_id
  end
end
