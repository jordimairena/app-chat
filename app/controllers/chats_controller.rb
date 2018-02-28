class ChatsController < ApplicationController
  def index
    @chats = current_user.chats
  end

  def new
    @chat = current_user.sent_chats.build
    @trainers = User.trainers
    @users = User.users
  end

  def create
    @chat = current_user.sent_chats.build(chat_params)

    if @chat.save
      redirect_to user_chats_path(current_user), success: 'Message sent successfully.'
    else
      redirect_to new_user_chat_path(current_user), flash: { error: @chat.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :sender_id, :receiver_id)
  end
end