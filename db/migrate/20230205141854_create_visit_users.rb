class CreateVisitUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :visit_users do |t|
      t.references :visit, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
