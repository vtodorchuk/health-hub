class MedicalCard < ApplicationRecord
  belongs_to :user

  has_many :visits, dependent: :destroy
end
