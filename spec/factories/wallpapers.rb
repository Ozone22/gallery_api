FactoryGirl.define do
  factory :wallpaper do
    name Faker::Lorem.word
    user FactoryGirl.create(:user)
  end
end
