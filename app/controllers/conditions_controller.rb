class ConditionsController < ApplicationController
  def create
    @condition = Condition.new(condition_params)
    unless @condition.save
      flash[:error] = @condition.errors.full_messages
      flash[:num] = params[:condition][:pc_number].to_i
      flash[:match] = "condition#{flash[:num]}"
      flash[:error_msg] = "PC#{flash[:num]}の変調を更新できませんでした。再度選択をお願いします。"
    end
    redirect_to room_path(token: params[:room_token])
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
