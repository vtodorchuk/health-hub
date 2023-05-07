# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @user = current_clinic.users.find_by(id: params[:user_id])

    @reports = @user.patient_reports
  end

  def new
    @user = current_clinic.users.find_by(id: params[:user_id])
  end
end
