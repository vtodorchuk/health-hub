# frozen_string_literal: true

class Pagination::UserPaginationService < PaginationService
  attr_reader :data, :page, :params, :q, :model

  def initialize(params)
    super(User, params)
  end

  def paginate(clinic_id)
    clinic_users(clinic_id)

    @q = model.ransack(params[:q])

    @page = params[:page]&.to_i || 1
    @role = params[:role]

    if @role.nil?
      reg_pagination(clinic_id)
    else
      role_filter(clinic_id)
    end

    self
  end

  def clinic_users(clinic_id)
    clinic = Clinic.find_by(id: clinic_id)
    @data = clinic.users
  end

  def role_filter(clinic_id)
    @data = Role.find_by(name: @role)&.users&.where(clinic_id:)&.order(created_at: :asc)&.page(@page)
  end

  def decorate_data_set
    @data = UserDecorator.decorate_collection(@data)
  end

  def reg_pagination(clinic_id)
    @data = @q.result(distinct: true).where(clinic_id:).order(created_at: :asc).page(@page)
  end
end
