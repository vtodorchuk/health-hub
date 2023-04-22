# frozen_string_literal: true

class Pagination::ClinicPaginationService < PaginationService
  attr_accessor :data, :page, :params, :q, :model

  def initialize(params)
    super(Clinic, params)
  end

  def paginate
    @q = model.ransack(params[:q])

    @page = params[:page]&.to_i || 1
    @city = params[:city]

    if @city.nil?
      reg_pagination
    else
      city_filter
    end

    self
  end

  def city_filter
    @data = Clinic.where(city: @city).order(created_at: :asc).page(@page)
  end
end
