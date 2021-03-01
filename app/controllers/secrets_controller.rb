class SecretsController < ApplicationController
  def create
    @add_secret = Secret.new(secret_params)
    if @add_secret.save
      redirect_to room_path(token: params[:room_token])
    else
      flash[:error] = @add_secret.errors.full_messages
      flash[:num] = params[:secret][:pc_number].to_i
      flash[:match] = "secret#{flash[:num]}"
      flash[:error_msg] = "PC#{flash[:num]}の秘密を更新できませんでした。再度入力をお願いします。"
      redirect_to room_path(token: params[:room_token])
    end
  end

  private

  def secret_params
    params.require(:secret).permit(:secret_n, :secret, :character_id)
  end
end
