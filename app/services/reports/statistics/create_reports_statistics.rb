# frozen_string_literal: true

module Reports
  module Statistics
    class CreateReportsStatistics
      @ctx = {}

      class << self
        attr_reader :ctx

        def call(current_clinic, params)
          ctx[:user] = current_clinic.users.find_by(id: params[:user_id])

          find_reports
          group_statistics
          details_statistics

          ctx
        end

        private

        def find_reports
          ctx[:start_time] = DateTime.now - 7.days
          ctx[:end_time] = DateTime.now

          ctx[:reports] = ctx[:user].patient_reports.where(created_at: ctx[:start_time]..ctx[:end_time])
        end

        def group_statistics
          service = Reports::ReportAnalyzer.new(ctx[:reports])
          ctx[:groups] = service.group_by_illnesses

          @statistics = {}

          ctx[:groups].each_key do |illness|
            @statistics[illness] = service.statistics_for_illness(illness)
          end

          ctx[:statistics] = @statistics
        end

        def details_statistics
          ctx[:report_medicines] = Reports::ReportDetailsAnalyzer.report_medicines(ctx[:reports])
          ctx[:report_analyzes] = Reports::ReportDetailsAnalyzer.report_analyzes(ctx[:reports])
          ctx[:report_examinations] = Reports::ReportDetailsAnalyzer.report_examinations(ctx[:reports])
        end
      end
    end
  end
end
