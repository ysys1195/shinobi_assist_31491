class SessionLogsController < ApplicationController
  def new
    @room = Room.find_by(token: params[:room_token])
    @characters = Character.where(room_id: @room.id)
    @session_log = SessionLog.new
  end

  def create
    @room = Room.find_by(token: params[:room_token])
    @session_log = SessionLog.new(session_log_params)
    if @session_log.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def session_log_params
    params.require(:session_log).permit(:title, :log).merge(user_id: current_user.id, room_id: @room.id)
  end
end
