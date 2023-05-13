# frozen_string_literal: true

class ExaminationsController < ApplicationController
  before_action :find_user_and_report, only: %i[index new]

  def index
    @examinations = @report.examinations

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
    examination = ReportExamination.new(permitted_params)

    respond_to do |format|
      if examination.save
        format.html { redirect_to clinic_user_reports_path(user_id: params[:user_id]) }
      else
        format.html do
          redirect_to new_clinic_user_report_examination_path(user_id: params[:user_id], report_id: params[:report_id]),
                      alert: examination.errors.full_messages
        end
      end
    end
  end

  private

  def permitted_params
    params.require(:report_examination).permit(%i[examination_id report_id description])
  end

  def find_user_and_report
    @user = current_clinic.users.find_by(id: params[:user_id])
    @report = @user.patient_reports.find_by(id: params[:report_id])
  end
end
