class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(token: @room.token)
    else
      render :index
    end
  end

  def show
    @room = Room.find_by(token: params[:token])
    @characters = Character.find_by(room_id: @room.id)
    @character = Character.new
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :player_number, :password, :password_confirmation).merge(user_id: current_user.id)
  end
end
