class CharactersController < ApplicationController
  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to root_path
    else
      render: :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:character_name, :secret, :last_resort)
  end
end
