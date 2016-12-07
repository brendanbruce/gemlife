require "faker"

FactoryGirl.define do
  factory :venue do |f|
    f.name { Faker::Book.title }
  end
end
