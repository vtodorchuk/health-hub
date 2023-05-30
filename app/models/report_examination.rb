class ReportExamination < ApplicationRecord
  belongs_to :report
  belongs_to :examination
end
