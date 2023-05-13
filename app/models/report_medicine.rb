class ReportMedicine < ApplicationRecord
  belongs_to :report
  belongs_to :medicine
end
