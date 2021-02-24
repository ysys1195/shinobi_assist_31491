class FeelingsController < ApplicationController
  def create
    @feeling = Feeling.new(feeling_params)
    return unless @feeling.save

    redirect_to room_path(token: params[:room_token])
  end

  private

  def feeling_params
    params.require(:feeling).permit(:feel_id, :feeling_to, :character_id)
  end
end
