class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :album_id
      t.string :title
      t.string :url
      t.string :trumbnail_url

      t.timestamps null: false
    end
  end
end
