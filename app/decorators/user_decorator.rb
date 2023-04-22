# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def username
    "#{first_name} #{last_name}"
  end

  def role
    roles.first.name.capitalize
  end
end
