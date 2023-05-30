module ApplicationHelper
  def current_clinic
    @current_clinic ||= current_user.clinic
  end
end
