class DeleteDefaultMusic < ActiveRecord::Migration[5.1]
  def change
    change_column :musics, :path, :string, :default => nil
  end
end
