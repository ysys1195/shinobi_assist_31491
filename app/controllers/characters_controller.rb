class CharactersController < ApplicationController
  def new
    @character = Character.new
  end

  def create
    @room = Room.find_by(token: params[:character][:room_token])
    @character = Character.new(character_params)
    if @character.save
      redirect_to root_path #room_path(token: room.token)
    else
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:character_name, :secret, :last_resort)
  end
end
