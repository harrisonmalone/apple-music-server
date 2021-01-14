class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :artist
      t.string :title
      t.string :year
      t.string :image_url

      t.timestamps
    end
  end
end
