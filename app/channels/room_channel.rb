class RoomChannel < ApplicationCable::Channel
  def subscribed
    reject unless room

    stream_for room
  end

  private

  def room
    Room.find params[:room]
  rescue ActiveRecord::RecordNotFound
    nil
  end
end
