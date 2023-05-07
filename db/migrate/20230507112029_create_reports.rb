class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.references :booking, null: false, foreign_key: true
      t.references :clinic, null: false, foreign_key: true

      t.text :illnesses
      t.string :status
      t.integer :blood_pressure
      t.integer :pulse
      t.float :temperature
      t.boolean :complications, null: false, default: false

      t.timestamps
    end

    add_foreign_key :reports, :users, column: :patient_id, primary_key: :id
    add_foreign_key :reports, :users, column: :doctor_id, primary_key: :id
  end
end
