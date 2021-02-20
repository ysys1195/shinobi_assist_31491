class CharactersController < ApplicationController

  def create
    @room = Room.find_by(token: params[:room_token])
    @character = Character.new(character_params)
    if @character.save
      redirect_to room_path(room_token: params[:token])
    else
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:character_name, :secret, :last_resort).merge(room_id: @room.id)
  end
end
