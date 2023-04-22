# frozen_string_literal: true

class PaginationService
  attr_reader :data, :page, :params, :q, :model

  def initialize(model, params)
    @model = model
    @params = params
  end

  def paginate
    @q = model.ransack(params[:q])

    @page = params[:page]&.to_i || 1

    reg_pagination

    self
  end

  def reg_pagination
    @data = @q.result(distinct: true).order(created_at: :asc).page(@page)
  end

  def call
    paginate
  end
end
