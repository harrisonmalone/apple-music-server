class AddDetailsToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :apple_music_id, :string
    add_column :albums, :genre, :string
    add_column :albums, :track_count, :string
    add_column :albums, :date_added, :date
  end
end
