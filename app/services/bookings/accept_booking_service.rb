# frozen_string_literal: true

class Bookings::AcceptBookingService
  def self.call(params, current_user)
    booking = Booking.find_by(id: params[:booking_id])

    if current_user.has_role? :doctor
      booking.update(status: 'scheduled', doctor_accepted: true)
    elsif current_user.has_role? :patient
      booking.update(status: 'scheduled', patient_accepted: true)
    end

    booking
  end
end
