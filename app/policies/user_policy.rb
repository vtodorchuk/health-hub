# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.has_role?(:doctor) || user.has_role?(:administrator)
  end
end
