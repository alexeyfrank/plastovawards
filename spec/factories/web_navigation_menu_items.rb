# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :web_navigation_menu_item, :class => 'Web::NavigationMenuItem' do
    name "MyString"
    slug "MyString"
    navigation_menu_id 1
    klass "MyString"
  end
end
