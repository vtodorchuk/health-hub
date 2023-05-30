class CreateReportMedicines < ActiveRecord::Migration[7.0]
  def change
    create_table :report_medicines do |t|
      t.references :report, null: false, foreign_key: true
      t.references :medicine, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
