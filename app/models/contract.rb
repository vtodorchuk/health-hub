class Contract < ApplicationRecord
  has_many :contract_users, dependent: :destroy
  has_many :users, through: :contract_users
end
