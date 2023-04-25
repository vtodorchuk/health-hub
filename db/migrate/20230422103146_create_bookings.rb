class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :service, null: false, foreign_key: true
      t.boolean :intake_forms, null: false, default: false
      t.boolean :online, null: false, default: false
      t.string :status, default: :pending
      t.numeric :duration, default: 15

      t.references :doctor
      t.references :patient

      t.boolean :doctor_accepted, default: false, null: false
      t.boolean :patient_accepted, default: false, null: false

      t.timestamps
    end

    add_foreign_key :bookings, :users, column: :patient_id, primary_key: :id
    add_foreign_key :bookings, :users, column: :doctor_id, primary_key: :id
  end
end
