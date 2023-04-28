# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find_by(id: params[:user_id])

    @patients = user.doctor_contracts

    respond_to do |format|
      format.html { render :index }
    end
  end
end
