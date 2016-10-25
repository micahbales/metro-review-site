FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "Builder"
    email "bob@thebuilder.com"
    password "password"
    admin false
  end

  factory :admin do
    first_name "Micah"
    last_name "Bales"
    email "m@bales.com"
    password "password"
    admin true
end
