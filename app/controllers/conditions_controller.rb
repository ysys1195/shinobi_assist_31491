class ConditionsController < ApplicationController
  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      redirect_to room_path(token: params[:room_token])
    else
      flash[:error] = @condition.errors.full_messages
      flash[:num] = params[:condition][:pc_number].to_i
      flash[:error_msg] = "PC#{flash[:num]}の変調を更新できませんでした。再度選択をお願いします。"
      redirect_to room_path(token: params[:room_token])
    end
  end

  def destroy
    condition = Condition.find(params[:id])
    condition.destroy
    redirect_to room_path(token: params[:room_token])
  end

  private

  def condition_params
    params.require(:condition).permit(:state_id, :character_id)
  end
end
