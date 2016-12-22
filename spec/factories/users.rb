FactoryGirl.define do
  factory :user do
    email
    password "123456"
    password_confirmation "123456"
    full_name
  end
end
