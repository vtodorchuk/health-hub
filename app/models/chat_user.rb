class ChatUser < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  belongs_to :clinic

end
