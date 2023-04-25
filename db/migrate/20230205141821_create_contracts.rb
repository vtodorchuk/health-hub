class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.text :body

      t.references :doctor
      t.references :patient

      t.timestamps
    end

    add_foreign_key :contracts, :users, column: :patient_id, primary_key: :id
    add_foreign_key :contracts, :users, column: :doctor_id, primary_key: :id
  end
end
