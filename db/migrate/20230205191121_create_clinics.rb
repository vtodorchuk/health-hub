class CreateClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.string :label
      t.string :tooltip
      t.string :city
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end

    add_column :medical_cards, :clinic_id, :integer
    add_column :contracts, :clinic_id, :integer

    add_foreign_key :medical_cards, :clinics, column: :clinic_id, primary_key: :id
    add_foreign_key :contracts, :clinics, column: :clinic_id, primary_key: :id
  end
end
