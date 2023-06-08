  FactoryBot.define do
    factory :ticket do
         user
         train
         booking_status { "Pending" }
         booking_date  {"10-07-2023"}
         sequence(:from_station)   { |n| "station #{n}" }
         sequence(:to_station)   { |n| "station #{n}" }
         class_type { "AC" }
         seat_type  { "LB" }
         sequence(:seat_no)   { |n| "#{n}" }
         mobile  { 8978675623 }
         sequence(:email) { |n| "user#{n}@gmail.com" }
         created_at        { Time.now }
         updated_at        { Time.now }
    end
  end