# frozen_string_literal: true

module Bookings
  class CreateBookingService
    def self.call(current_user, service, params)
      doctor_accepted = current_user.has_role? :doctor
      patient_accepted = current_user.has_role? :patient

      Booking.new(service_id: service.id,
                  start_time: params[:booking][:start_time],
                  end_time: params[:booking][:start_time].to_datetime + params[:booking][:duration].to_i.minutes,
                  doctor_id: params[:booking][:doctor],
                  patient_id: params[:booking][:patient],
                  online: params[:booking][:online],
                  doctor_accepted:,
                  patient_accepted:)
    end
  end
end
