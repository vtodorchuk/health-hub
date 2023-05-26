class CreateReportFields < ActiveRecord::Migration[7.0]
  def change
    create_table :report_fields do |t|
      t.references :report, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
