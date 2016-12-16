class ImageValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.size < 6.megabytes
    record.errors[attribute] << (options[:message] || I18n.t("activerecord.errors.attributes.image.large_size"))
  end
end
