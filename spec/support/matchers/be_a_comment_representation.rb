RSpec::Matchers.define :be_a_comment_representation do |comment|
  match do |json|
    response_attributes = comment.attributes.slice %w(
      id
      commenter_name
      wallpaper_id
      text
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
