class CharactersController < ApplicationController
  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    room = Room.find(params[:room_id])
    if @character.save
      redirect_to room_path(token: @room.token)
    else
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:character_name, :secret, :last_resort)
  end
end
