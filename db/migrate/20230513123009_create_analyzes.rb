class CreateAnalyzes < ActiveRecord::Migration[7.0]
  def change
    create_table :analyzes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
