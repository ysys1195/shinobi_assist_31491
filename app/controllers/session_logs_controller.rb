class SessionLogsController < ApplicationController

  def new
    @room = Room.find_by(token: params[:room_token])
    @characters = Character.where(room_id: @room.id)
    @session_log = SessionLog.new
  end

  def create
    @session_log = SessionLog.new(session_log_params)
    if @session_log.save
      redirect_to user_path(current_user.id)
    else
      @room = Room.find(params[:session_log][:room_id])
      @characters = Character.where(room_id: @room.id)
      render :new
    end
  end

  def edit
    @session_log = SessionLog.find(params[:id])
  end

  def update
    @session_log = SessionLog.find(params[:id])
    if @session_log.update(session_log_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def session_log_params
    params.require(:session_log).permit(:title, :log).merge(user_id: current_user.id)
  end
end
