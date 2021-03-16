class FeelingsController < ApplicationController
  def create
    @feeling = Feeling.new(feeling_params)
    respond_to do |format|
      if @feeling.save
        @num = Character.find(@feeling.character_id).pc_number
        @room = Room.find_by(token: params[:room_token])
        format.js { render 'add_feeling' }
      else
        flash[:feeling_info] = { feel_id: @feeling.feel_id, feeling_to: @feeling.feeling_to }
        flash[:error] = @feeling.errors.full_messages
        flash[:num] = params[:feeling][:pc_number].to_i
        flash[:match] = "feeling#{flash[:num]}"
        flash[:error_msg] = "PC#{flash[:num]}の感情を更新できませんでした。再度選択をお願いします。"
        format.js { render 'shared/errors' }
      end
      format.html { redirect_to room_path(token: params[:room_token]) }
    end
  end

  def destroy
    @feeling = Feeling.find(params[:id])
    @feeling.destroy
    respond_to do |format|
      format.html { redirect_to room_path(token: params[:room_token]) }
      format.js { render 'destroy' }
    end
  end

  private

  def feeling_params
    params.require(:feeling).permit(:feel_id, :feeling_to, :character_id)
  end
end
