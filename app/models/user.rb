class User < ApplicationRecord
  rolify
  after_create :add_medical_card

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

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

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.create(
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user.first_name = access_token.info.first_name
    user.first_name = access_token.info.last_name
    user.avatar = access_token.info.image
    user.uid = access_token.uid
    user.provider = access_token.provider
  end
end
