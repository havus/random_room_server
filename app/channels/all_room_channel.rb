
class AllRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'all_room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
