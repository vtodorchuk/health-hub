# frozen_string_literal: true

module Reports
  class ReportDetailsAnalyzer
    class << self
      def report_medicines(reports)
        reports.map(&:medicines).flatten.group_by { |x| x }.values
      end

      def report_analyzes(reports)
        reports.map(&:analyzes).flatten.group_by { |x| x }.values
      end

      def report_examinations(reports)
        reports.map(&:examinations).flatten.group_by { |x| x }.values
      end
    end
  end
end
