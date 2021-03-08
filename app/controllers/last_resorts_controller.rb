class LastResortsController < ApplicationController
  def create
    @add_last_resort = LastResort.new(last_resort_params)
    unless @add_last_resort.save
      flash[:error] = @add_last_resort.errors.full_messages
      flash[:num] = params[:last_resort][:pc_number].to_i
      flash[:match] = "lr#{flash[:num]}"
      flash[:error_msg] = "PC#{flash[:num]}の奥義を更新できませんでした。再度入力をお願いします。"
    end
    redirect_to room_path(token: params[:room_token])
  end

  def update
    @edit_last_resort = LastResort.find(params[:id])
    unless @edit_last_resort.update(last_resort_params)
      flash[:error] = @edit_last_resort.errors.full_messages
      flash[:num] = params[:last_resort][:pc_number].to_i
      flash[:match] = "lr#{flash[:num]}"
      flash[:error_msg] = "PC#{flash[:num]}の奥義を更新できませんでした。再度入力をお願いします。"
    end
    redirect_to room_path(token: params[:room_token])
  end

  private

  def last_resort_params
    params.require(:last_resort).permit(:last_resort_n, :last_resort, :character_id)
  end
end
