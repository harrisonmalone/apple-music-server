class AddWikipediaAndPitchforkToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :wikipedia, :string
    add_column :albums, :pitchfork, :string
  end
end
