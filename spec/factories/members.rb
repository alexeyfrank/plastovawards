# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    first_name "MyString"
    last_name "MyString"
    birth_year "MyString"
    country "MyString"
    city "MyString"
    phone "MyString"
    email "MyString"
    competition_state_id 1
    bid_state_id 1
  end
end
