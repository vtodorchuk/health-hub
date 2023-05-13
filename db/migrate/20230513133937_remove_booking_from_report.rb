class RemoveBookingFromReport < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reports, :booking, index: true, foreign_key: true
  end
end
