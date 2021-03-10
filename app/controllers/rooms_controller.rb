class RoomsController < ApplicationController
  before_action :move_to_index

  def index
  end


  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to controller: :rooms, action: :index
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to controller: :rooms, action: :index
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
