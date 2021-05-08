class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show, :destroy]
  before_action :find_room, only: [:show, :destroy]

  def index
    @room = Room.new
    @enter_room = EnterRoom.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      Room.gm_role(@room)
      redirect_to room_path(token: @room.token)
    else
      render :index
    end
  end

  def show
    @role = Role.find_by(user_id: current_user.id, room_id: @room.id)
    if @role.nil?
      redirect_to root_path
    else
      @role = @role.role
    end

    @characters = Character.where(room_id: @room.id)
    @character_info = CharacterInfo.new(flash[:char_info] || {})
    @add_secret = Secret.new
    @add_last_resort = LastResort.new
    @condition = Condition.new
    @feeling = Feeling.new(flash[:feeling_info] || {})

    @secrets = Secret.where(character_id: @characters.ids)
    @last_resorts = LastResort.where(character_id: @characters.ids)
    @conditions = Condition.where(character_id: @characters.ids)
    @feelings = Feeling.where(character_id: @characters.ids)
    @open_secrets = OpenSecret.where(secret_id: @secrets.ids)
    @open_last_resorts = OpenLastResort.where(last_resort_id: @last_resorts.ids)
  end

  def update
    @room_name = Room.find_by(token: params[:token])
    # respond_to do |format|
      if @room_name.update(edit_room_name)
        render 'rooms/edit_room_name'
        # format.js { render 'rooms/edit_room_name' }
      else
        flash[:error] = @room_name.errors.full_messages
        render 'shared/errors'
        # format.js { render 'shared/errors' }
      end
    # end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :player_number, :password, :password_confirmation).merge(user_id: current_user.id)
  end

  def find_room
    @room = Room.find_by(token: params[:token])
  end

  def edit_room_name
    params.require(:room).permit(:room_name).merge(player_number: @room_name.player_number, user_id: current_user.id)
  end
end
