# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = current_user.messages.build(messages_params)
    @message.chat_id = params[:chat_id]
    @message.save
  end

  private

  def messages_params
    params.require(:message).permit(:content, :files)
  end
end
