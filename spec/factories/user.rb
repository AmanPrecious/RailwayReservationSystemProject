FactoryBot.define do
    factory :user do
      email   { Faker::Internet.email}
      sequence(:first_name)  { |n| "first #{n}" }
      sequence(:last_name)    { |n| "last #{n}" }
      mobile  { "8978675623 "}
      address { "Indore" } 
      password {"user123"}
     
    end
end