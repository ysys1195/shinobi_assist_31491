class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @room = Room.new
  end

  def create
    binding.pry
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :player_number, :password, :password_confirmation).merge(user_id: current_user.id)
  end
end
