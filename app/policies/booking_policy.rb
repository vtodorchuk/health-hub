# frozen_string_literal: true

class BookingPolicy < ApplicationPolicy
  def update?
    booking.status != 'cancelled' || booking.status != 'completed'
  end
end
