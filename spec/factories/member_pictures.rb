# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member_picture do
    size "MyString"
    description "MyText"
    create_year "MyString"
    technique "MyString"
    member_id 1
  end
end
