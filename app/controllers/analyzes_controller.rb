# frozen_string_literal: true

class AnalyzesController < ApplicationController
  before_action :find_user_and_report, only: %i[index new]

  def index
    @analyzes = @report.analyzes

    respond_to do |format|
      format.html { render :index }
    end
  end

  def new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    analyze = ReportAnalyze.new(permitted_params)

    respond_to do |format|
      if analyze.save
        format.html { redirect_to clinic_user_report_analyzes_path(user_id: params[:user_id], report_id: params[:report_id]) }
      else
        format.html do
          redirect_to new_clinic_user_report_analyze_path(user_id: params[:user_id], report_id: params[:report_id]),
                      alert: analyze.errors.full_messages
        end
      end
    end
  end

  private

  def permitted_params
    params.require(:report_analyze).permit(%i[analyze_id report_id description])
  end

  def find_user_and_report
    @user = current_clinic.users.find_by(id: params[:user_id])
    @report = @user.patient_reports.find_by(id: params[:report_id])
  end
end
