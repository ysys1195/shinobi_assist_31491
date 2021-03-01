class FeelingsController < ApplicationController
  def create
    @feeling = Feeling.new(feeling_params)
    unless @feeling.save
      flash[:feeling_info] = { feel_id: @feeling.feel_id, feeling_to: @feeling.feeling_to }
      flash[:error] = @feeling.errors.full_messages
      flash[:num] = params[:feeling][:pc_number].to_i
      flash[:match] = "feeling#{flash[:num]}"
      flash[:error_msg] = "PC#{flash[:num]}の感情を更新できませんでした。再度選択をお願いします。"
    end
    redirect_to room_path(token: params[:room_token])
  end

  def destroy
    feeling = Feeling.find(params[:id])
    feeling.destroy
    redirect_to room_path(token: params[:room_token])
  end

  private

  def feeling_params
    params.require(:feeling).permit(:feel_id, :feeling_to, :character_id)
  end
end
