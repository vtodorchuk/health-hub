class Report < ApplicationRecord
  belongs_to :booking
  belongs_to :clinic

  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'
end
