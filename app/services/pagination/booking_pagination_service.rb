# frozen_string_literal: true

class Pagination::BookingPaginationService < PaginationService
  def initialize(params)
    super(Booking, params)
  end

  def paginate
    @page = params[:page]&.to_i || 1
    day = params[:day].to_i.day

    date = DateTime.now + day
    user = User.find_by(id: params[:user_id])

    @data = if user.has_role? :doctor
              user.doctor_bookings.where(start_time: date.in_time_zone(Time.zone).all_day).page(@page)
            else
              user.patient_bookings.where(start_time: date.in_time_zone(Time.zone).all_day).page(@page)
            end

    self
  end
end
