class LastResortsController < ApplicationController
  before_action :find_room, only: [:create, :update]
  
  def create
    @add_last_resort = LastResort.new(last_resort_params)
    respond_to do |format|
      if @add_last_resort.save
        character = Character.find(@add_last_resort.character_id).pc_number
        @room.player_number.times do |n|
          OpenLastResort.create(lr_unveil_to: n + 1, unveiled_id: 1, last_resort_id: @add_last_resort.id) unless character == n + 1
        end
        @open_last_resorts = OpenLastResort.where(last_resort_id: @add_last_resort.id)
        @role = Role.find_by(user_id: current_user.id, room_id: @room.id).role
        @lr = { num: character, selected_char: Character.find(@add_last_resort.character_id) }
        @characters = Character.where(room_id: @room.id)
        format.js { render 'last_resorts/add_last_resort' }
      else
        flash[:error] = @add_last_resort.errors.full_messages
        flash[:num] = params[:last_resort][:pc_number].to_i
        flash[:match] = "lr#{flash[:num]}"
        flash[:error_msg] = "PC#{flash[:num]}の奥義を更新できませんでした。再度入力をお願いします。"
        format.js { render 'shared/errors' }
      end
      format.html { redirect_to room_path(token: @room.token) }
    end
  end

  def update
    @edit_last_resort = LastResort.find(params[:id])
    unless @edit_last_resort.update(last_resort_params)
      flash[:error] = @edit_last_resort.errors.full_messages
      flash[:num] = params[:last_resort][:pc_number].to_i
      flash[:match] = "lr#{flash[:num]}"
      flash[:error_msg] = "PC#{flash[:num]}の奥義を更新できませんでした。再度入力をお願いします。"
    end
    redirect_to room_path(token: @room.token)
  end

  private

  def last_resort_params
    params.require(:last_resort).permit(:last_resort_n, :last_resort, :character_id)
  end

  def find_room
    @room = Room.find_by(token: params[:room_token])
  end
end
