FactoryBot.define do
    factory :train do
      train_number { Faker::Number.number(digits: 4) } 
      sequence(:train_name)  { |n| "train#{n}" } 
      sequence(:source_station)    { |n| "s_station #{n}" }
      sequence(:destination_station)   { |n| "d_station #{n}" }
      arrival_time { "10:30 am" }
      departure_time { "6:35 pm" }
     
    end
end


