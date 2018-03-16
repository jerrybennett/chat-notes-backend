class Api::V1::ChatRoomUsersController < ApplicationController
  before_action :set_chat_room

  def index
    @chatRoomUsers = ChatRoomUser.all
    render json: @chatRoomUsers, status: 200
  end

  def create
    @chat_room_user = ChatRoomUser.new(chat_room_user_params)

    if @chat_room_user.save
      render json: @chat_room_user, status: :created, location: api_v1_chat_room_users(@chat_room_user)
    else
      render json: @chat_room_user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @chat_room_user = @chat_room.chat_room_users.find_by(user_id: user.id).destroy
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_room
      @chat_room_user = ChatRoomUser.find(chat_room_user_params)
    end

    # Only allow a trusted parameter "white list" through.
    def chat_room_user_params
      params.require(:chat_room_user).permit(:user_id, :chat_room_id)
    end

end
