# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    email "MyString"
    phone "MyString"
    text "MyString"
  end
end
