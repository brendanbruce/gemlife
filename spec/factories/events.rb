require "faker"

FactoryGirl.define do
  factory :event do |f|
    f.title { Faker::Book.title }
    f.description { Faker::Hipster.sentence }
    f.start_date Date.today
    f.start_time Time.now
    user
    venue
  end
end
