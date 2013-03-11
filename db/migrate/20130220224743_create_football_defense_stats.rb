class CreateFootballDefenseStats < ActiveRecord::Migration
  def change
        create_table :football_defense_stats do |t|
          t.date    :date_played_on
          t.string  :opponent
          t.integer :solo_tackles
          t.integer :total_tackles
          t.integer :assisted_tackles
          t.decimal :sacks
          t.integer :stuffs
          t.integer :stuff_yards
          t.integer :forced_fumbles
          t.integer :fumbles_recovered
          t.integer :fumbles_returned_for_touchdown
          t.integer :kicks_blocked
          t.integer :interceptions
          t.integer :intercepted_returned_yards
          t.decimal :average_intercepted_return_yards
          t.integer :longest_interception_return
          t.integer :interceptions_returned_for_touchdown
          t.integer :passes_defended
          t.integer :safeties
          t.string  :status
          t.references :user

          t.timestamps
        end
        add_index :football_defense_stats, :user_id
      end

end
