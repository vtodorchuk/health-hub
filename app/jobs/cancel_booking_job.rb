class CancelBookingJob < ApplicationJob
  queue_as :default

  def perform(booking)
    Booking.find_by(id: booking.id)&.destroy
  end
end
