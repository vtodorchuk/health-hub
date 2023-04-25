class Booking < ApplicationRecord
  ABILITY_TO_CANCEL_BOOKING = %w[cancelled completed].freeze

  belongs_to :service

  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'

  scope :pending, -> { where(status: 'pending') }
  scope :cancelled, -> { where(status: 'cancelled') }
  scope :completed, -> { where(status: 'completed') }
  scope :scheduled, -> { where(status: 'scheduled') }

  validates :end_time, comparison: { greater_than: :start_time }
  validates :start_time, presence: true, if: :date_validates

  private

  def date_validates
    return unless start_time <= DateTime.now

    errors.add :start_time, I18n.t('booking.validates.start_time')
  end
end
