class AddPathMusic < ActiveRecord::Migration[5.1]
  def change
    add_column :musics, :path, :string, :default => '/'
  end
end
