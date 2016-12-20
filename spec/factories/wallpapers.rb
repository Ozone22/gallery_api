FactoryGirl.define do
  factory :wallpaper do
    name { generate(:random_name) }
    user
    image
  end
end
