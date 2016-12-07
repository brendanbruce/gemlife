require "faker"

FactoryGirl.define do
  factory :event do |f|
    f.title { Faker::Book.title }
    f.description { Faker::Hipster.sentence }
    f.start_date Date.tomorrow
    f.start_time Time.now + (2*7*24*60*60)
  end
end
