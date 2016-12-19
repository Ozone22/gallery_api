RSpec::Matchers.define :be_a_wallpaper_representation do |wallpaper|
  match do |json|
    response_attributes = wallpaper.attributes.slice %w(
      id
      user_id
      name
      image
      likes_count
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
