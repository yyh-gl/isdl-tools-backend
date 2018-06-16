class AddCo < ActiveRecord::Migration[5.1]
  def change
    add_column :user_musics, :music_id, :string
    add_column :user_musics, :local_path, :string
  end
end
