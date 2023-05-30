# frozen_string_literal: true

class BookingDecorator < Draper::Decorator
  delegate_all

  def date
    start_time.strftime('%b, %MM').to_s
  end

  def time
    "#{start_time.in_time_zone(Time.zone).strftime('%I:%M %p')} - #{end_time.in_time_zone(Time.zone).strftime('%I:%M %p')}"
  end
end
