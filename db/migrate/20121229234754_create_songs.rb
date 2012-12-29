class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.text :lyrics
      t.integer :band_id

      t.timestamps
    end

    add_index :songs, :band_id
  end
end
