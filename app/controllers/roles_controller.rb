class RolesController < ApplicationController
  def create
    @enter_room = EnterRoom.new(enter_room_params)
    if @enter_room.valid?
      @room = Room.find_by(token: params[:enter_room][:token])
      if @room.nil?
        flash[:error] = ['入力された招待コードが存在しません。']
        redirect_to root_path and return
      elsif @room.player_number < @enter_room.role.to_i
        flash[:error] = ['指定した部屋に該当のPC番号が存在しません。']
        redirect_to root_path and return
      end
      @enter_room.save(@room)
      redirect_to room_path(token: @room.token)
    else
      flash[:error] = @enter_room.errors
      redirect_to root_path
    end
  end

  private

  def enter_room_params
    params.require(:enter_room).permit(:role, :token, :password).merge(user_id: current_user.id)
  end
end
