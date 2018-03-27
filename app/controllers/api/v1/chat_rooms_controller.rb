class Api::V1::ChatRoomsController < ApplicationController
  # before_action :set_chat_room, only: [:show, :edit, :update, :destroy]

  # GET /chat_rooms
  def index
    @chat_rooms = ChatRoom.all
    render json: @chat_rooms
  end

  def new
    @chat_room = ChatRoom.new
  end


####this method can be used to find messages for a particular chat_room
  def messages
    #### finds a ChatRoom by the 'id' params, though 'id' could be anything like 'beef' as it is only a parameter that will accept anything you pass it.
    chat_room = ChatRoom.find(params[:id])
    user = User.find(params[:user_id])
    # notes = Note.find_by(chatroom_id: chat_room.id, user_id: user.id)
    #### this 'render json:' returns the messages associated with the chat_room that has matching parameters. in this case...all messages associated with the chat_room_id of 'params[:id]' or for example all messagess that are associated with ChatRoom(id: 1) would be returned for a 'GET' request.
    render json: {messages: chat_room.messages.map{|message| MessageSerializer.new(message)}, notes: chat_room.notes.map{|note| NoteSerializer.new(note)}}
  end

  def users
    chat_room = ChatRoom.find(params[:id])

    render json: chat_room.users
  end

  def notes
    chat_room = ChatRoom.find(params[:id])

    render json: chat_room.notes
  end


  # GET /chat_rooms/1
  def show
    render json: @chat_room
  end

  # POST /chat_rooms
  def create
    user = User.all.last
    # @chat_room = ChatRoom.new(chat_room_params)
    @chat_room = ChatRoom.new(chat_room_params)

    if @chat_room.save
      @chat_room.users << user
      #user serializer for response. json: {input: message, user: user}
      render json: @chat_room
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
