class CreateBasketballStats < ActiveRecord::Migration
  def change
    create_table :basketball_stats do |t|
      t.date :date_played_on
      t.string :opponent
      t.integer :time_played_in_seconds
      t.integer :field_goals_made
      t.integer :field_goals_attempted
      t.integer :threepts_made
      t.integer :threepts_attempted
      t.integer :free_throws_made
      t.integer :free_throws_attempted
      t.integer :offensive_rebounds
      t.integer :defensive_rebounds
      t.integer :total_rebounds
      t.integer :assists
      t.integer :turnovers
      t.integer :steals
      t.integer :blocks
      t.integer :personal_fouls
      t.decimal :field_goal_percentage
      t.decimal :threept_percentage
      t.decimal :free_throw_percentage
      t.integer :total_points
      t.references :user

      t.timestamps
    end
    add_index :basketball_stats, :user_id
  end
end
