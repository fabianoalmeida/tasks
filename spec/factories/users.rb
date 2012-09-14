# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  sequence( :email ) { |n| "email_#{n}@test.com" }
  sequence( :name  ) { |n| "Name#{n}" }

  factory :user do
    first_name { generate( :name ) }
    last_name  { generate( :name ) }
    email      { generate( :email ) }
    password   "foobar"
    username   { generate( :name ) }
    password_confirmation { |user| user.password }
  end
end
