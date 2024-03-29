# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    pagy = Pagination::UserPaginationService.new(params).call

    @q = pagy.q

    @page = pagy.page
    @total_pages = pagy.data.total_pages

    @users = pagy.decorate_data_set
  end

  def show
    user = User.find_by(id: params[:id])

    if user.present?
      @user = user.decorate
    else
      redirect_to users_path, alert: 'No such user found!'
    end
  end

  def edit
    user = User.find_by(id: params[:id])

    if user.present?
      @user = user.decorate
    else
      redirect_to users_path, alert: 'No such user found!'
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(permitted_params[:user])
      redirect_to user_path(user.id), notice: 'Success!'
    else
      redirect_to users_path, alert: user.errors.full_messages.join(', ')
    end
  end

  def profile
    user = current_user

    if user.present?
      @user = user.decorate
      render 'users/show'
    else
      redirect_to users_path, alert: 'No such user found!'
    end
  end

  private

  def permitted_params
    params.permit(:id, user: %i[first_name last_name phone birthday avatar])
  end
end
