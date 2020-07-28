module RoomMessagesHelper
  def message_time_format message
    # "%T" == "%H:%M:%S"
    if message.created_at.today?
      message.created_at.strftime "%T"
    else
      message.created_at.strftime "%b-%d-%Y"
    end
  end
end
