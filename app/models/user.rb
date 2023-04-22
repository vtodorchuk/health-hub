class User < ApplicationRecord
  rolify
  after_create :add_medical_card

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_one :medical_card, dependent: :destroy
  belongs_to :clinic

  has_many :visit_user, dependent: :destroy
  has_many :visits, through: :visit_user

  has_many :contract_users, dependent: :destroy
  has_many :contracts, through: :contract_users

  has_many :chat_users, dependent: :destroy
  has_many :chats, through: :chat_users

  has_many :messages, dependent: :destroy
  has_many :notifications, dependent: :destroy, as: :recipient

  private

  def add_medical_card
    MedicalCard.create(user_id: id)
    add_role :patient
  end
end
