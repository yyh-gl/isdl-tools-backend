class AddColumnMusic < ActiveRecord::Migration[5.1]
  def change
    add_column :musics, :upload, :boolean, :default => false
  end
end
