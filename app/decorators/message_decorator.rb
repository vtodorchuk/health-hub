# frozen_string_literal: true

class MessageDecorator < Draper::Decorator
  delegate_all

  def send_at
    created_at.strftime('%d %A | %H:%M')
  end
end
