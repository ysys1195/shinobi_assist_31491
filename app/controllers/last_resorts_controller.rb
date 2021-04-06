class LastResortsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  before_action :find_room, only: [:create, :update]

  def create
    @add_last_resort = LastResort.new(last_resort_params)
    respond_to do |format|
      if @add_last_resort.save
        character = Character.find(@add_last_resort.character_id)
        LastResort.create_open_lrs(@room.player_number, @add_last_resort.id, character)
        definition_create(character)
        format.js { render 'last_resorts/add_last_resort' }
      else
        error_message(params[:last_resort][:pc_number], @add_last_resort)
        format.js { render 'shared/errors' }
      end
      format.html { redirect_to room_path(token: @room.token) }
    end
  end

  def update
    @edit_last_resort = LastResort.find(params[:id])
    respond_to do |format|
      if @edit_last_resort.update(last_resort_params)
        @pc_num = Character.find(@edit_last_resort.character_id).pc_number
        format.js { render 'last_resorts/edit_last_resort' }
      else
        error_message(params[:last_resort][:pc_number], @edit_last_resort)
        format.js { render 'shared/errors' }
      end
      format.html { redirect_to room_path(token: @room.token) }
    end
  end

  private

  def last_resort_params
    params.require(:last_resort).permit(:last_resort_n, :last_resort, :character_id)
  end

  def find_room
    @room = Room.find_by(token: params[:room_token])
  end

  def definition_create(character)
    @open_last_resorts = OpenLastResort.where(last_resort_id: @add_last_resort.id)
    @role = Role.find_by(user_id: current_user.id, room_id: @room.id).role
    @lr = { num: character.pc_number, selected_char: character }
    @characters = Character.where(room_id: @room.id)
  end

  def error_message(num, input)
    flash[:error] = input.errors.full_messages
    flash[:num] = num.to_i
    flash[:match] = "lr#{flash[:num]}"
    flash[:error_msg] = "PC#{flash[:num]}の奥義を更新できませんでした。再度入力をお願いします。"
  end
end
