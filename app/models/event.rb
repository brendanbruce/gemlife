class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :venue

  accepts_nested_attributes_for :venue

  def venue_name
    if venue.blank?
      "No venue defined"
    else
      venue.name
    end
  end

  def upcoming?(event)
    event_time = event.date
    if event_time > Time.now
      return true
    elsif event_time.nil? || event_time < Time.now
      return false
    end
  end
end

