class Visit < ApplicationRecord
  DEFAULT_END_TIME = 45.minutes

  belongs_to :medical_card

  has_many :visit_user, dependent: :destroy
  has_many :users, through: :visit_user
end
