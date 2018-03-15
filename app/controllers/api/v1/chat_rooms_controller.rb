class Api::V1::ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: [:show, :edit, :update, :destroy]

  # GET /chat_rooms
  def index
    @chat_rooms = ChatRoom.all
    render json: @chat_rooms
  end

  # GET /chat_rooms/1
  def show
    render json: @chat_room
  end

  # POST /chat_rooms
  def create
    @chat_room = ChatRoom.new(chat_room_params)
    user = User.all.last
    if @chat_room.save
      @chat_room.chat_room_users.find_or_create_by(user_id: user.id)
      render json: @chat_room, status: :created, location: api_v1_chat_rooms(@chat_room)
    else
      render json: @chat_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chat_rooms/1
  def update
    if @chat_room.update(chat_room_params)
      render json: @chat_room
    else
      render json: @chat_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chat_rooms/1
  def destroy
    @chat_room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_room
      @chat_room = ChatRoom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chat_room_params
      params.require(:chat_room).permit(:name)
    end
end
