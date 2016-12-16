FactoryGirl.define do
  factory :wallpaper do
    name { generate(:random_name) }
    user FactoryGirl.create(:user)
    image
  end
end
