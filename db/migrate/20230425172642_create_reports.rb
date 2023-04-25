class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.text :illnesses
      t.string :status
      t.integer :blood_pressure
      t.integer :pulse
      t.float :temperature
      t.boolean :complications

      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end

    add_foreign_key :reports, :users, column: :patient_id, primary_key: :id
    add_foreign_key :reports, :users, column: :doctor_id, primary_key: :id
  end
end