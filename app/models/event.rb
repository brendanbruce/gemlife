class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
end

def upcoming?(event)
  event_time = event.date
  if event_time > Time.now
    return true
  elsif event_time.nil? || event_time < Time.now
    return false
  end
end
