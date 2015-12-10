class User < ActiveRecord::Base
  after_create :skip_confirm!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :likes
  has_many :events, :through => :likes

  def skip_confirm!
    self.confirm! if Rails.env.development?
  end
end
