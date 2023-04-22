# frozen_string_literal: true

class MedicalCardsController < ApplicationController
  def show
    @medical_card = MedicalCard.find_by(id: params[:id])
  end

  def profile_medical_card
    @medical_card = current_user.medical_card

    render 'medical_cards/show'
  end
end
