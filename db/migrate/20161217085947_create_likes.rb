class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :wallpaper_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :likes, %i(wallpaper_id user_id), unique: true
  end
end
