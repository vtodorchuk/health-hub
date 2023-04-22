class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.text :body

      t.timestamps
    end
  end
end
