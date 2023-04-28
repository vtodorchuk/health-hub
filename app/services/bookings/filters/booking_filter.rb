# frozen_string_literal: true

module Bookings
  module Filters
    class BookingFilter
      def self.by_date(current_user, start_time, end_time)
        if current_user.has_role? :doctor
          current_user.doctor_bookings.where(
            start_time: (start_time - 15.minutes)...(end_time + 15.minutes)
          )
        else
          current_user.patient_bookings.where(
            start_time: (start_time - 15.minutes)...(end_time + 15.minutes)
          )
        end
      end

      def self.by_role(user, params)
        if user.has_role? :doctor
          user.doctor_bookings.find_by(id: params[:id])
        else
          user.patient_bookings.find_by(id: params[:id])
        end
      end
    end
  end
end
