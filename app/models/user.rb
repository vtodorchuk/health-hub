class User < ApplicationRecord
  rolify
  after_create :add_role_to_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_one :medical_card, dependent: :destroy
  belongs_to :clinic

  has_many :doctor_contracts, class_name: 'Contract', foreign_key: 'doctor_id', dependent: :destroy
  has_many :patient_contracts, class_name: 'Contract', foreign_key: 'patient_id', dependent: :destroy

  has_many :chat_users, dependent: :destroy
  has_many :chats, through: :chat_users

  has_many :messages, dependent: :destroy
  has_many :notifications, dependent: :destroy, as: :recipient

  has_many :doctor_bookings, class_name: 'Booking', foreign_key: 'doctor_id', dependent: :destroy
  has_many :patient_bookings, class_name: 'Booking', foreign_key: 'patient_id', dependent: :destroy

  has_many :services, dependent: :destroy

  has_many :patient_reports, class_name: 'Report', foreign_key: 'patient_id', dependent: :destroy
  has_many :doctor_reports, class_name: 'Report', foreign_key: 'doctor_id', dependent: :destroy

  private

  def add_role_to_user
    add_role :patient
  end
end
