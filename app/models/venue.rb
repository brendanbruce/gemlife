class Venue < ActiveRecord::Base
  validates :name, presence: true

  has_many :events
  has_many :follows, as: :followable
end
