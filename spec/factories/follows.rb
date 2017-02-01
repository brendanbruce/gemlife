FactoryGirl.define do
  factory :follow do |f|
    f.association :profile
    f.association :followable, factory: :venue
  end
end
