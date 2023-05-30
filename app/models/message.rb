class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  belongs_to :clinic

  has_many_attached :files

  validates :content, presence: true

  after_commit do
    broadcast_append_to "chat_#{chat.id}"
  end

  after_commit :create_notifications, on: [:create]

  def create_notifications
    Notification.create do |notification|
      notification.notify_type = 'message'
      notification.actor = user
      notification.user = chat.decorate.next_user(user)
      notification.target = self
      notification.second_target = chat
    end
  end
end
