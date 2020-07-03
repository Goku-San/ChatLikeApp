class RoomsController < ApplicationController
  before_action :load_rooms, except: %i[new create]

  def index; end

  def show
    @room_message  = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes :user
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new room_params

    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @room.update room_params
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def load_rooms
    @room  = Room.find params[:id] if params[:id]
    @rooms = Room.all
  end

  def room_params
    params.require(:room).permit :name
  end
end
