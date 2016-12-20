FactoryGirl.define do
  sequence(:image) { File.open("spec/fixtures/wallpapers/image.jpeg") }
  sequence(:email) { Faker::Internet.email }
  sequence(:full_name) { Faker::Name.name }
  sequence(:random_name) { Faker::Lorem.word }
  sequence(:text) { Faker::Lorem.sentence }
end
