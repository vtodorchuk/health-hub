class Booking < ApplicationRecord
  include DateValidation

  ABILITY_TO_CANCEL_BOOKING = %w[cancelled completed].freeze

  belongs_to :service

  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'

  scope :pending, -> { where(status: 'pending') }
  scope :cancelled, -> { where(status: 'cancelled') }
  scope :completed, -> { where(status: 'completed') }
  scope :scheduled, -> { where(status: 'scheduled') }

  validates :end_time, comparison: { greater_than: :start_time }
  # validates :start_time, presence: true, if: :date_validates

  has_one :report, dependent: :destroy
end
