class OpenSecretsController < ApplicationController
  # def edit
  #   @open_secret = OpenSecret.find(params[:id])
  #   @open_secret.update(open_secret_params)
  #   redirect_to room_path(token: params[room_token])
  # end

  def unveiled
    open_secret = OpenSecret.find(params[:id])
    if open_secret.unveiled_id == 1
      open_secret.update(unveiled_id: 2)
    else
      open_secret.update(unveiled_id: 1)
    end

    item = OpenSecret.find(params[:id])
    render json:{ open_secret: item, unveil: item.unveiled.name }
  end

  private

  def open_secret_params
    params.require(:open_secret).permit(:secret_unveil_to, :unveiled_id, :secret_id)
  end
end
