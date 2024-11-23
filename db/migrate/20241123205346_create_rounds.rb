class CreateRounds < ActiveRecord::Migration[7.1]
  def change
    create_table :rounds do |t|
      t.integer :player_id
      t.string :score_1
      t.string :score_2
      t.string :score_3
      t.string :score_4
      t.boolean :called_clutch
      t.string :score_5

      t.timestamps
    end
  end
end
