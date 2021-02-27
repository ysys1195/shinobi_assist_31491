class FeelingsController < ApplicationController
  def create
    @feeling = Feeling.new(feeling_params)
    if @feeling.save
      redirect_to room_path(token: params[:room_token])
    else
      flash[:feeling_info] = {feel_id: @feeling.feel_id, feeling_to: @feeling.feeling_to}
      flash[:error] = @feeling.errors.full_messages
      flash[:num] = params[:feeling][:pc_number].to_i
      flash[:error_msg] = "PC#{flash[:num]}の変調を更新できませんでした。再度選択をお願いします。"
      redirect_to room_path(token: params[:room_token])
    end
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
