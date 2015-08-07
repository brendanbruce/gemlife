class Venue < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :events
end