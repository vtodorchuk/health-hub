class AddClinicToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :clinic, foreign_key: true
  end
end
