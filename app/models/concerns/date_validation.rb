# frozen_string_literal: true

module DateValidation
  extend ActiveSupport::Concern

  included do
    def date_validates
      return unless start_time <= DateTime.now

      errors.add :start_time, I18n.t('booking.validates.start_time')
    end

    def validate_collision
      start_time = params[:booking][:start_time].to_datetime
      end_time = start_time + params[:booking][:duration].to_i

      @bookings = Bookings::Filters::BookingFilter.by_date(current_user, start_time, end_time)

      return if @bookings.empty?

      respond_to do |format|
        format.html do
          redirect_to user_bookings_path(user_id: current_user.id, day: params[:day]), alert: t('booking.validates.collision')
        end
      end
    end
  end
end
