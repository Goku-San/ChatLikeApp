class RoomChannel < ApplicationCable::Channel
  def subscribed
    reject unless room

    stream_for room
  end

  private

  def room
    return unless params[:room]

    Room.find params[:room]
  end
end
