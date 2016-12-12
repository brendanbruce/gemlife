class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :start_time, presence: true


  has_attached_file :flyer, styles: {
    preview: "640x640"
  }

  validates_attachment :flyer, content_type: {
    content_type: ["image/jpg",
                   "image/jpeg",
                   "image/png",
                   "image/gif"] }

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  validates :user, presence: true

  belongs_to :venue
  validates :venue, presence: true
  accepts_nested_attributes_for :venue

  has_many :likes
  has_many :users, through: :likes

  has_many :gigs
  has_many :profiles, through: :gigs
  accepts_nested_attributes_for :gigs
  accepts_nested_attributes_for :profiles
  attr_accessor :profile_id

  acts_as_taggable

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

