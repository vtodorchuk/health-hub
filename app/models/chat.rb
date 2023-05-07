class Chat < ApplicationRecord
  has_many :chat_users, dependent: :destroy
  has_many :users, through: :chat_users
  belongs_to :clinic

  has_many :messages, dependent: :destroy
end
