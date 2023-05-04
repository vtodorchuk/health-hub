class CreateReportComplications < ActiveRecord::Migration[7.0]
  def change
    create_table :report_complications do |t|
      t.string :complication
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
