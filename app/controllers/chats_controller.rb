# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :authenticate_user!
  def index
    @chats = current_user.chats.order(:updated_at)
  end

  def show
    @chat = Chat.find_by(id: params[:id])

    redirect_to chats_path if @chat.nil?

    @you_id = current_user.id
    @messages = @chat.messages
  end

  def new; end

  def create
    clinic = current_user.clinic
    chat = Chat.new(name: "user#{current_user.id}_user#{params[:user_id]}", clinic_id: clinic.id)

    if chat.save
      ChatUser.create(user_id: current_user.id, chat_id: chat.id, clinic_id: clinic.id)
      ChatUser.create(user_id: params[:user_id], chat_id: chat.id, clinic_id: clinic.id)

      redirect_to clinic_chat_path(id: chat)
    else
      redirect_to clinic_chats_path, alert: chat.errors.full_messages.join(', ')
    end
  end
end
