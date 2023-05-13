class Examination < ApplicationRecord
  has_many :report_details, dependent: :destroy
end
