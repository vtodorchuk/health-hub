class CreateContractUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :contract_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
