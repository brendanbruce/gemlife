class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  has_attached_file :flyer, styles: {
    preview: "640x640"
  }
  validates_attachment :flyer, content_type: {
    content_type: ["image/jpg",
                   "image/jpeg",
                   "image/png",
                   "image/gif"] }

  belongs_to :venue

  has_many :likes
  has_many :users, :through => :likes

  accepts_nested_attributes_for :venue

  def likes_count
    likes.count
  end

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

