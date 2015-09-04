class User < ActiveRecord::Base
  after_create :skip_confirm!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def skip_confirm!
    self.confirm! if Rails.env.development?
  end
end
