require "faker"

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(8) }
    f.confirmed_at 7.days.ago
  end
end
