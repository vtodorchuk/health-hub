class MedicalCard < ApplicationRecord
  belongs_to :user
  belongs_to :clinic

  has_many :visits, dependent: :destroy
end
