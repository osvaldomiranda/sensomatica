class ImgNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "img_notifications_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end