require "faker"

FactoryGirl.define do
  factory :profile do |profile|
    profile.name { Faker::Name.name }
  end
end
