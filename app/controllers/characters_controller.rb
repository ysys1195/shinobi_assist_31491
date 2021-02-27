class CharactersController < ApplicationController
  def create
    room = Room.find_by(token: params[:room_token])
    @character_info = CharacterInfo.new(character_info_params)
    if @character_info.valid?
      @character_info.save
      redirect_to room_path(token: room.token)
    else
      flash[:char_info] = {character_name: @character_info.character_name, secret: @character_info.secret, last_resort: @character_info.last_resort}
      flash[:error] = @character_info.errors.full_messages
      flash[:num] = @character_info.pc_number.to_i
      flash[:error_msg] = "キャラクター情報を登録できませんでした。リロードせず、再度入力をお願いします。"
      
      redirect_to room_path(token: room.token)
    end
  end

  def update
    @room = Room.find_by(token: params[:room_token])
    @char = Character.find(params[:id])
    return unless @char.update(character_params)

    redirect_to room_path(token: @room.token)
  end

  private

  def character_info_params
    params.require(:character_info).permit(:character_name, :pc_number, :secret_n, :secret, :last_resort_n, :last_resort)
  end
end
