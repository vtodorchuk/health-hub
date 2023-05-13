# frozen_string_literal: true

class MedicinesController < ApplicationController
  before_action :find_user_and_report, only: %i[index new]

  def index
    @medicines = @report.medicines

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
    medicine = ReportMedicine.new(permitted_params)

    respond_to do |format|
      if medicine.save
        format.html { redirect_to clinic_user_report_medicines_path(user_id: params[:user_id], report_id: params[:report_id]) }
      else
        format.html do
          redirect_to new_clinic_user_report_medicine_path(user_id: params[:user_id], report_id: params[:report_id]),
                      alert: medicine.errors.full_messages
        end
      end
    end
  end

  private

  def permitted_params
    params.require(:report_medicine).permit(%i[medicine_id report_id description])
  end

  def find_user_and_report
    @user = current_clinic.users.find_by(id: params[:user_id])
    @report = @user.patient_reports.find_by(id: params[:report_id])
  end
end
