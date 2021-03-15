class SecretsController < ApplicationController
  def create
    @add_secret = Secret.new(secret_params)
    respond_to do |format|
      if @add_secret.save
        character = Character.find(@add_secret.character_id).pc_number
        @room = Room.find_by(token: params[:room_token])
        @room.player_number.times do |n|
          OpenSecret.create(secret_unveil_to: n + 1, unveiled_id: 1, secret_id: @add_secret.id) unless character == n + 1
        end
        @open_secrets = OpenSecret.where(secret_id: @add_secret.id)
        @role = Role.find_by(user_id: current_user.id, room_id: @room.id).role
        @secret = { num: character.to_i, selected_char: Character.find(@add_secret.character_id) }
        @characters = Character.where(room_id: @room.id)
        format.js { render 'secrets/add_secret' }
      else
        flash[:error] = @add_secret.errors.full_messages
        flash[:num] = params[:secret][:pc_number].to_i
        flash[:match] = "secret#{flash[:num]}"
        flash[:error_msg] = "PC#{flash[:num]}の秘密を更新できませんでした。再度入力をお願いします。"
        format.js { render 'shared/errors' }
      end
      format.html { redirect_to room_path(token: params[:room_token]) }
    end
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
