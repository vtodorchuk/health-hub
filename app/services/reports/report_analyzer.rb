# frozen_string_literal: true
# rubocop:disable all
#
module Reports
  class ReportAnalyzer
    attr_accessor :reports

    def initialize(reports)
      @reports = reports
    end

    def group_by_illnesses
      @reports.group_by(&:illnesses)
    end

    def statistics_for_illness(illness)
      reports_for_illness = @reports.select { |report| report.illnesses == illness }

      {
        average_blood_pressure: (reports_for_illness.sum(&:blood_pressure).to_f / reports_for_illness.length).round(2),
        average_pulse: (reports_for_illness.sum(&:pulse).to_f / reports_for_illness.length).round(2),
        average_temperature: (reports_for_illness.sum(&:temperature).to_f / reports_for_illness.length).round(2),
        highest_blood_pressure: reports_for_illness.max_by(&:blood_pressure).blood_pressure.round(2),
        lowest_blood_pressure: reports_for_illness.min_by(&:blood_pressure).blood_pressure.round(2),
        highest_pulse: reports_for_illness.max_by(&:pulse).pulse.round(2),
        lowest_pulse: reports_for_illness.min_by(&:pulse).pulse.round(2),
        highest_temperature: reports_for_illness.max_by(&:temperature).temperature.round(2),
        lowest_temperature: reports_for_illness.min_by(&:temperature).temperature.round(2)
      }
    end

    def overall_statistics
      {
        average_blood_pressure: (@reports.sum(&:blood_pressure).to_f / @reports.length).round(2),
        average_pulse: (@reports.sum(&:pulse).to_f / @reports.length).round(2),
        average_temperature: (@reports.sum(&:temperature).to_f / @reports.length).round(2),
        highest_blood_pressure: @reports.max_by(&:blood_pressure).blood_pressure.round(2),
        lowest_blood_pressure: @reports.min_by(&:blood_pressure).blood_pressure.round(2),
        highest_pulse: @reports.max_by(&:pulse).pulse.round(2),
        lowest_pulse: @reports.min_by(&:pulse).pulse.round(2),
        highest_temperature: @reports.max_by(&:temperature).temperature.round(2),
        lowest_temperature: @reports.min_by(&:temperature).temperature.round(2)
      }
    end
  end

end