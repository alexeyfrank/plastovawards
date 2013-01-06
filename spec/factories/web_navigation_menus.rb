# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :web_navigation_menu, :class => 'Web::NavigationMenu' do
    name "MyString"
    description "MyString"
  end
end
