class SecretsController < ApplicationController
  def create
    @add_secret = Secret.new(secret_params)
    unless @add_secret.save
      flash[:error] = @add_secret.errors.full_messages
      flash[:num] = params[:secret][:pc_number].to_i
      flash[:match] = "secret#{flash[:num]}"
      flash[:error_msg] = "PC#{flash[:num]}の秘密を更新できませんでした。再度入力をお願いします。"
    end
    redirect_to room_path(token: params[:room_token])
  end

  def update
    @edit_secret = Secret.find(params[:id])
    unless @edit_secret.update(secret_params)
      flash[:error] = @edit_secret.errors.full_messages
      flash[:num] = params[:secret][:pc_number].to_i
      flash[:match] = "secret#{flash[:num]}"
      flash[:error_msg] = "PC#{flash[:num]}の秘密を更新できませんでした。再度入力をお願いします。"
    end
    redirect_to room_path(token: params[:room_token])
  end

  private

  def secret_params
    params.require(:secret).permit(:secret_n, :secret, :character_id)
  end
end
