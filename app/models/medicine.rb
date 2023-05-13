class Medicine < ApplicationRecord
  has_many :report_details, dependent: :destroy
end
