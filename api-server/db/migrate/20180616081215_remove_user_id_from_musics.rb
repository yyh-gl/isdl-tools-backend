class RemoveUserIdFromMusics < ActiveRecord::Migration[5.1]
  def change
    remove_column :musics, :user_id, :integer
  end
end
