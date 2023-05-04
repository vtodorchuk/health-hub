# frozen_string_literal: true

module ServiceFinder
  extend ActiveSupport::Concern

  included do
    def service_validation
      @service = ClinicService.call(params[:booking][:service], current_user)

      return unless @service.nil?

      redirect_to new_user_booking_path(user_id: current_user.id), alert: t('booking.custom_service.not_found')
    end
  end
end
