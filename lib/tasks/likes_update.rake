namespace :likes do
  desc "Update likes count on wallpapers"
  task update: :environment do
    Wallpaper.reset_column_information
    Wallpaper.find_each do |w|
      w.update_attribute :likes_count, w.likes.length
    end
  end
end
