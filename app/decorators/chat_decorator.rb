# frozen_string_literal: true

class ChatDecorator < Draper::Decorator
  delegate_all

  def usernames(current_user)
    if users.first.id == current_user.id
      users.last.decorate.username
    else
      users.first.decorate.username
    end
  end

  def next_user(current_user)
    if users.first.id == current_user.id
      users.last
    else
      users.first
    end
  end
end
