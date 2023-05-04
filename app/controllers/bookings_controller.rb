# frozen_string_literal: true

class BookingsController < ApplicationController
  include ServiceFinder

  before_action :authenticate_user!
  before_action :validate_collision, only: :create
  before_action :service_validation, only: :create

  def index
    @day = params[:day].to_i || DateTime.now.strftime('%d').to_i
    @date = DateTime.now + @day

    p = Pagination::BookingPaginationService.new(params).paginate

    @bookings = p.data

    respond_to do |format|
      format.html { render :index }
    end
  end

  def show
    user = User.find_by(id: params[:user_id])

    return redirect_to session[:prev_url] if user.nil?

    booking = Bookings::Filters::BookingFilter.by_role(user, params)

    respond_to do |format|
      if booking
        @booking = booking.decorate
        format.html do
          render :show
        end
      else
        format.html do
          redirect_to user_bookings_path, alert: t('booking.not_found')
        end
      end
    end
  end

  def create
    booking = Bookings::CreateBookingService.call(current_user, @service, params)

    respond_to do |format|
      if booking.save
        CancelBookingJob.set(wait_until: booking.end_time).perform_later(booking)

        format.html do
          redirect_to user_bookings_path(user_id: current_user.id, day: params[:day]), notice: t('booking.created')
        end
      else
        format.html do
          redirect_to user_bookings_path(user_id: current_user.id, day: params[:day]), alert: booking.errors.full_messages
        end
      end
    end
  end

  def update; end

  def accept
    @booking = Bookings::AcceptBookingService.call(params, current_user)

    respond_to do |format|
      if @booking.nil?
        format.html do
          redirect_to user_bookings_path(user_id: current_user.id, day: params[:day]), alert: t('booking.not_found')
        end
      else
        format.html do
          redirect_to user_booking_path(user_id: current_user.id, id: @booking.id), notice: t('booking.accepted')
        end
      end
    end
  end

  def cancel
    @booking = Bookings::CancelBookingService.call(params)

    respond_to do |format|
      if @booking.nil?
        format.html do
          redirect_to user_bookings_path(user_id: current_user.id, day: params[:day]), alert: t('booking.not_found')
        end
      else
        format.html do
          redirect_to user_booking_path(user_id: current_user.id, id: @booking.id), notice: t('booking.cancelled')
        end
      end
    end
  end
end
