class VisitUser < ApplicationRecord
  belongs_to :visit
  belongs_to :user
  belongs_to :clinic
end
