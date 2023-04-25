# frozen_string_literal: true

class MedicalCardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @medical_card = MedicalCard.find_by(id: params[:id])

    @bookings = User.find_by(id: @medical_card.user.id).bookings
  end

  def profile_medical_card
    @medical_card = current_user.medical_card

    render 'medical_cards/show'
  end
end
