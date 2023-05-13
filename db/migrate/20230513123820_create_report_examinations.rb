class CreateReportExaminations < ActiveRecord::Migration[7.0]
  def change
    create_table :report_examinations do |t|
      t.references :report, null: false, foreign_key: true
      t.references :examination, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
