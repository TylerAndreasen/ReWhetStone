class CreateRounds < ActiveRecord::Migration[7.1]
  def change
    create_table :rounds do |t|
      t.belongs_to :player, index: true, foreign_key: true
      t.string :score_1
      t.string :score_2
      t.string :score_3
      t.string :score_4
      t.string :called_clutch
      t.string :score_5

      t.timestamps
    end
  end
end
