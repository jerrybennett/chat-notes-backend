class Api::V1::ChatRoomUsersController < ApplicationController
  def index
    @chatRoomUsers = ChatRoomUser.all
    render json: @chatRoomUsers, status: 200
  end
end
