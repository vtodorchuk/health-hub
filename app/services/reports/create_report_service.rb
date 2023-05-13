# frozen_string_literal: true

module Reports
  class CreateReportService
    @ctx = {}

    def self.call(_current_user, _current_clinic, params)
      params = params.require(:report).permit(%i[clinic_id doctor_id patient_id illnesses blood_pressure pulse temperature
                                                 complications])

      report = Report.new(params)

      if report.save
        @ctx[:result] = Result.new(true)
        @ctx[:report] = report
      else
        @ctx[:result] = Result.new(false)
        @ctx[:errors] = report.errors
      end

      @ctx
    end

    class Result
      attr_accessor :result

      def initialize(result)
        @result = result
      end

      def success?
        result
      end
    end
  end
end
