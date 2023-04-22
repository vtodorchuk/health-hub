class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :service, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :intake_forms, null: false, default: false
      t.boolean :online, null: false, default: false

      t.timestamps
    end
  end
end
