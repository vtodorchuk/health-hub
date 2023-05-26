class Field < ApplicationRecord
  has_many :report_fields, dependent: :destroy
  has_many :reports, through: :report_fields
end
