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
  end
end
