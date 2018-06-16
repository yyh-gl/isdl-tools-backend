class Add < ActiveRecord::Migration[5.1]
  def change
    add_column :musics, :user_id, :integer, :default => 0
  end
end
