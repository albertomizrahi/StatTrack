class CreateSportizations < ActiveRecord::Migration
  def change
    create_table :sportizations do |t|
      t.integer :user_id
      t.integer :sport_id
      t.string :position

      t.timestamps
    end

    add_index :sportizations, :user_id
    add_index :sportizations, :sport_id
    add_index :sportizations, [:user_id, :sport_id, :position], unique: true

  end
end
