# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    reports = Report.all

    analyzer = Reports::ReportAnalyzer.new(reports)
    @group_by_illnesses = analyzer.group_by_illnesses
    @statistics = analyzer.overall_statistics
  end

  def new
    @booking = Booking.find_by(id: params[:booking_id])
  end
end
