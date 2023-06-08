FactoryBot.define do
  factory :passenger do
    ticket
    sequence(:p_name)    { |n| "Passenger #{n}" }
    sequence(:p_age)   { |n| 22 }
    sequence(:p_gender)    { |n| "Male" }
   
  end
end
