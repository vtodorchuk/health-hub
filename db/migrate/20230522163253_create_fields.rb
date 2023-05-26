class CreateFields < ActiveRecord::Migration[7.0]
  def change
    create_table :fields do |t|
      t.string :name
      t.string :value
      t.string :max_value
      t.string :min_value
      t.string :illness

      t.timestamps
    end
  end
end
