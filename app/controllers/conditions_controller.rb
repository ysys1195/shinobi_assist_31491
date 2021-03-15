class ConditionsController < ApplicationController
  def create
    @condition = Condition.new(condition_params)
    respond_to do |format|
      if @condition.save
        @pc_num = Character.find(@condition.character_id).pc_number
        @room = Room.find_by(token: params[:room_token])
        format.js { render 'conditions/add_condition' }
      else
        flash[:error] = @condition.errors.full_messages
        flash[:num] = params[:condition][:pc_number].to_i
        flash[:match] = "condition#{flash[:num]}"
        flash[:error_msg] = "PC#{flash[:num]}の変調を更新できませんでした。再度選択をお願いします。"
        format.js { render 'shared/errors' }
      end
      format.html { redirect_to room_path(token: params[:room_token]) }
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
