# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    date = DateTime.now.in_time_zone(Time.zone).all_day

    @user = current_clinic.users.find_by(id: params[:user_id])
    @reports = @user.patient_reports.where(created_at: date)

    respond_to do |format|
      format.html { render :index }
    end
  end

  def show
    @user = current_clinic.users.find_by(id: params[:user_id])
    @report = @user.patient_reports.find_by(id: params[:id])

    @medicines = @report.medicines
    @analyzes = @report.analyzes
    @examinations = @report.examinations

    respond_to do |format|
      format.html { render :show }
    end
  end

  def new
    @user = current_clinic.users.find_by(id: params[:user_id])

    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    result = Reports::CreateReportService.call(current_user, current_clinic, params)

    respond_to do |format|
      if result[:result].success?
        format.html { redirect_to clinic_user_report_medicines_path(user_id: params[:user_id], report_id: result[:report].id) }
      else
        format.html { redirect_to new_clinic_user_report_path(user_id: params[:user_id]), alert: result[:errors].full_messages }
      end
    end
  end

  def statistic
    result = Reports::Statistics::CreateReportsStatistics.call(current_clinic, params)

    @user = result[:user]

    @groups = result[:groups]
    @statistics = result[:statistics]

    @report_medicines = result[:report_medicines]
    @report_analyzes = result[:report_analyzes]
    @report_examinations = result[:report_examinations]

    @start_time = result[:start_time].strftime('%b, %d')
    @end_time = result[:end_time].strftime('%b, %d')

    respond_to do |format|
      format.html { render :statistics }
    end
  end
end
