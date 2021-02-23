class ConditionsController < ApplicationController
  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      redirect_to room_path(token: params[:room_token])
    end
  end

  private
  
  def condition_params
    params.require(:condition).permit(:state_id, :character_id)
  end
end
