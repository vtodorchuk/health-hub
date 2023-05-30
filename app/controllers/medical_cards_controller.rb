# frozen_string_literal: true

class MedicalCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :create_medical_card
  def show
    @medical_card = MedicalCard.find_by(id: params[:id])

    @bookings = User.find_by(id: @medical_card.user.id).bookings
  end

  def profile_medical_card
    @medical_card = current_user.medical_card

    render 'medical_cards/show'
  end

  private

  def create_medical_card
    MedicalCard.create(user_id: current_user.id, clinic_id: current_clinic.id) unless current_user.medical_card.nil?
  end
end
