class Follow < ActiveRecord::Base
  belongs_to :followable, polymorphic: true
  belongs_to :profile

  validates :profile_id, presence: true
  validates :followable_id, presence: true
  validates :followable_type, presence: true

  validates :profile_id, :uniqueness => { :scope => [:followable_type, :followable_id] }

  def followable_id_for
    class_name = followable_type.constantize
    class_name.find(followable_id)
  end

  def name
    followable_id_for.name
  end

  def image
    followable_id_for.name
  end
end
