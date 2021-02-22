class CharactersController < ApplicationController

  def create
    @room = Room.find_by(token: params[:character][:room_token])
    @character = Character.new(character_params)
    if @character.save
      redirect_to room_path(token: @room.token)
    end
  end

  def update
    @room = Room.find_by(token: params[:room_token])
    @char = Character.find(params[:id])
    if @char.update(character_params)
      redirect_to room_path(token: @room.token)
    end
  end

  private

  def character_params
    params.require(:character).permit(:character_name, :pc_number, :secret, :last_resort).merge(room_id: @room.id)
  end
end
