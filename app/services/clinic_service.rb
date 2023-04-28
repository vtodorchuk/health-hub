# frozen_string_literal: true

class ClinicService
  class << self
    def call(service_name, _current_user)
      find_service service_name
    end

    private

    def find_service(service_name)
      Service.find_by(name: service_name)
    end
  end
end
