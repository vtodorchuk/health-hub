class CreateMedicalCards < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_cards do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
