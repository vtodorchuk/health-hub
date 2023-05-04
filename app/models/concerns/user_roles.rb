# frozen_string_literal: true

module UserRoles
  extend ActiveSupport::Concern

  included do
    rolify

    def add_medical_card
      MedicalCard.create(user_id: id)
      add_role :patient
    end
  end
end
