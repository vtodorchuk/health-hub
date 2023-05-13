class Report < ApplicationRecord
  belongs_to :clinic

  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'

  has_many :report_medicines, dependent: :destroy
  has_many :medicines, through: :report_medicines

  has_many :report_analyzes, dependent: :destroy
  has_many :analyzes, through: :report_analyzes

  has_many :report_examinations, dependent: :destroy
  has_many :examinations, through: :report_examinations
end
