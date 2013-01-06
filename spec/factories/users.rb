# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "12345"
    first_name "John"
    last_name "Doe"
  end
end
