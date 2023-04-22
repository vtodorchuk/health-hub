class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.references :medical_card, null: false, foreign_key: true
      t.string :title, null: false
      t.text :instructions
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
