class VisitUser < ApplicationRecord
  belongs_to :visit
  belongs_to :user
end
