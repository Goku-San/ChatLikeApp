class RoomMessagesController < ApplicationController
  before_action :load_room

  def create
    @room_message = RoomMessage.new \
      user:    current_user,
      room:    @room,
      message: params.dig(:room_message, :message)

    if @room_message.save
      head :ok

      RoomChannel.broadcast_to @room, @room_message
    else
      render json: { errors: @room_message.errors }, status: :unprocessable_entity
    end
  end

  private

  def load_room
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
