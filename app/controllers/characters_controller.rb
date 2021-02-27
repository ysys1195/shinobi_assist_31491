class CharactersController < ApplicationController
  before_action :find_room, only: [:create, :update]

  def create
    @character_info = CharacterInfo.new(character_info_params)
    if @character_info.valid?
      @character_info.save(@room)
      redirect_to room_path(token: @room.token)
    else
      flash[:char_info] = {character_name: @character_info.character_name, secret: @character_info.secret, last_resort: @character_info.last_resort}
      flash[:error] = @character_info.errors.full_messages
      flash[:num] = @character_info.pc_number.to_i
      flash[:error_msg] = "キャラクター情報を登録できませんでした。リロードせず、再度入力をお願いします。"

      redirect_to room_path(token: @room.token)
    end
  end

  def update
    @char = Character.find(params[:id])
    if @char.update(character_params)
      redirect_to room_path(token: @room.token)
    else
      flash[:error] = @char.errors.full_messages
      flash[:num] = @char.pc_number.to_i
      flash[:error_msg] = "キャラクター情報を更新できませんでした。再度入力をお願いします。"

      redirect_to room_path(token: @room.token)
    end
  end

  private

  def character_info_params
    params.require(:character_info).permit(:character_name, :pc_number, :secret_n, :secret, :last_resort_n, :last_resort)
  end

  def character_params
    params.require(:character).permit(:character_name, :pc_number).merge(room_id: @room.id)
  end

  def find_room
    @room = Room.find_by(token: params[:room_token])
  end
end
