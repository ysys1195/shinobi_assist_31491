class ErrorChannel < ApplicationCable::Channel
  def subscribed
    stream_from "error_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
