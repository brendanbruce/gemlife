class Profile < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to :user

  has_many :gigs
  has_many :events, through: :gigs

  has_many :follows, as: :followable
  has_many :follows

  has_attached_file :image, styles: {
    preview: "640x640"
  }
  validates_attachment :image, content_type: {
    content_type: ["image/jpg",
                   "image/jpeg",
                   "image/png",
                   "image/gif"] }

  def followers(type = nil)
    if type
      Follow.where(followable_id: self.id, followable_type: type)
    else
      Follow.where(followable_id: self.id)
    end
  end

  def following(type = nil)
    if type
      Follow.where(profile_id: self.id, followable_type: type)
    else
      Follow.where(profile_id: self.id)
    end
  end
end
