# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscriber do
    email "MyString"
    fio "MyString"
    phone "MyString"
    processing_personal_data false
    notify_about_center_events false
  end
end
