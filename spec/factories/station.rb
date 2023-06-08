FactoryBot.define do
    factory :station do
      sequence(:stn_name) { |n| "station #{n}" }
      sequence(:stn_location)   { |n| "stn_location #{n}" }
      sequence(:stn_code) { Faker::Number.number(digits: 4) } 
      created_at        { Time.now }
      updated_at        { Time.now }
    end
  end