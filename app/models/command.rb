class Command < ActiveRecord::Base

  after_save :addlog

  def addlog
    # ActionCable.server.broadcast 'web_notifications_channel', message: "<h3>#{self.command} #{self.status}</h3>"
  end
end

