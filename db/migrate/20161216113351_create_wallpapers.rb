class CreateWallpapers < ActiveRecord::Migration[5.0]
  def change
    create_table :wallpapers do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :image
      t.timestamps
    end
  end
end
