class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  def self.types
    %w(Fan Artist)
  end

  scope :fans, -> { where(type: "Fan") }
  scope :artists, -> { where(type: "Artist") }

end
