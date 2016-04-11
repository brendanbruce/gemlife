class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :gigs
  has_many :events, through: :gigs

  has_attached_file :image, styles: {
    preview: "640x640"
  }
  validates_attachment :image, content_type: {
    content_type: ["image/jpg",
                   "image/jpeg",
                   "image/png",
                   "image/gif"] }
end
