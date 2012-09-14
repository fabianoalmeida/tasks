# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
    name    { generate( :name ) }
    limited false
    user
  end
end
