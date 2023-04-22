# frozen_string_literal: true

class ClinicsController < ApplicationController
  def index
    pagy = Pagination::ClinicPaginationService.new(params).call

    @q = pagy.q

    @page = pagy.page
    @total_pages = pagy.data.total_pages

    @clinics = pagy.data
  end
end
