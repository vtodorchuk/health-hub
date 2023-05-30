class ApplicationController < ActionController::Base
  rescue_from ActionPolicy::Unauthorized, with: :unauthorized
  before_action :prev_url

  private

  def unauthorized
    redirect_to session[:previous_request_url], alert: [t('unauthorized')]
  end

  def prev_url
    session[:previous_request_url] = session[:current_request_url]
    session[:current_request_url] = request.url
  end

  def current_clinic
    @current_clinic ||= current_user.clinic
  end
end
