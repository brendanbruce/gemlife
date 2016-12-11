class User < ActiveRecord::Base
  after_create :skip_confirm!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :events

  has_many :likes
  has_many :events, :through => :likes
  has_one :profile

  def skip_confirm!
    self.confirm! if Rails.env.development?
  end
end
