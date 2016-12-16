class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def store_dir
    "gallery_images/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    eager
    resize_to_fit(300, 300)
    cloudinary_transformation quality: 80
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  private

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
