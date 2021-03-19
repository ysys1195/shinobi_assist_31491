class UsersController < ApplicationController
  def show
    @session_logs = SessionLog.where(user_id: current_user.id)
  end
end
