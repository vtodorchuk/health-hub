class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  has_many_attached :files

  validates :content, presence: true

  after_commit do
    broadcast_append_to "chat_#{chat.id}"
  end

  after_commit :create_notifications, on: [:create]

  def create_notifications
    Notification.create do |notification|
      notification.notify_type = 'message'
      notification.actor = self.user
      notification.user = self.chat.decorate.next_user(self.user)
      notification.target = self
      notification.second_target = self.chat
    end
  end
end
