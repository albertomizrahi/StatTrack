class CreateFootballRunningbackStats < ActiveRecord::Migration
  def change
    create_table :football_runningback_stats do |t|
      t.date :date_played_on
      t.string :opponent
      t.integer :rushing_attempts
      t.integer :rushing_yards
      t.decimal :rushing_average
      t.integer :longest_run
      t.integer :rushing_touchdowns
      t.integer :receptions
      t.integer :receiving_yards
      t.decimal :receiving_average
      t.integer :longest_reception
      t.integer :receiving_touchdowns
      t.integer :fumbles
      t.integer :fumbles_lost
      t.string  :status
      t.references :user

      t.timestamps
    end
    add_index :football_runningback_stats, :user_id
  end
end
