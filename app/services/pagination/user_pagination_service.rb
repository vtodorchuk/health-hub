# frozen_string_literal: true
class Pagination::UserPaginationService < PaginationService
  attr_reader :data, :page, :params, :q, :model

  def initialize(params)
    super(User, params)
  end

  def paginate
    @q = model.ransack(params[:q])

    @page = params[:page]&.to_i || 1
    @role = params[:role]

    if @role.nil?
      reg_pagination
    else
      role_filter
    end

    self
  end

  def role_filter
    @data = Role.find_by(name: @role).users.order(created_at: :asc).page(@page)
  end

  def decorate_data_set
    @data = UserDecorator.decorate_collection(@data)
  end
end
