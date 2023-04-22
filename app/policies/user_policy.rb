# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.has_role? :doctor
  end
end
