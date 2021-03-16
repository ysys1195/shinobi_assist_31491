class SecretsController < ApplicationController
  def create
    @add_secret = Secret.new(secret_params)
    respond_to do |format|
      if @add_secret.save
        character = Character.find(@add_secret.character_id)
        @room = Room.find_by(token: params[:room_token])
        @room.player_number.times do |n|
          OpenSecret.create(secret_unveil_to: n + 1, unveiled_id: 1, secret_id: @add_secret.id) if character.pc_number != n + 1
        end
        definition_create(character)
        format.js { render 'secrets/add_secret' }
      else
        error_message(params[:secret][:pc_number], @add_secret)
        format.js { render 'shared/errors' }
      end
      format.html { redirect_to room_path(token: params[:room_token]) }
    end
  end

  def update
    @edit_secret = Secret.find(params[:id])
    respond_to do |format|
      if @edit_secret.update(secret_params)
        @pc_num = Character.find(@edit_secret.character_id).pc_number
        format.js { render 'secrets/edit_secret' }
      else
        error_message(params[:secret][:pc_number], @edit_secret)
        format.js { render 'shared/errors' }
      end
      format.html { redirect_to room_path(token: params[:room_token]) }
    end
  end

  private

  def secret_params
    params.require(:secret).permit(:secret_n, :secret, :character_id)
  end

  def definition_create(character)
    @open_secrets = OpenSecret.where(secret_id: @add_secret.id)
    @role = Role.find_by(user_id: current_user.id, room_id: @room.id).role
    @secret = { num: character.pc_number, selected_char: character }
    @characters = Character.where(room_id: @room.id)
  end

  def error_message(num, input)
    flash[:error] = input.errors.full_messages
    flash[:num] = num.to_i
    flash[:match] = "secret#{flash[:num]}"
    flash[:error_msg] = "PC#{flash[:num]}の秘密を更新できませんでした。再度入力をお願いします。"
  end
end
