class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    #Goal:
    # chat_room = ChatRoom.find(params[:chat_room_id])

    chat_room = ChatRoom.all.last

    @user.chat_room = chat_room

    @users.each do |i|
      chat_room_user = ChatRoomUser.find_or_create_by(set_user: i)
      if !chat_room_user.users.include?(user.id)
        chat_room_user.users << user
      end
    end

    if @user.save
      render json: @user, status: :created, location: api_v1_users(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
