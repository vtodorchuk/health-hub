# frozen_string_literal: true

class Bookings::CancelBookingService
  def self.call(params)
    booking = Booking.find_by(id: params[:booking_id])

    booking.update(status: 'cancelled')

    booking
  end
end
