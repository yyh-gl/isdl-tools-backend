class CreateUserCrossMusics < ActiveRecord::Migration[5.1]
  def change
    create_table :user_cross_musics do |t|
      t.integer :user_id
      t.integer :music_id
      t.boolean :flag

      t.timestamps
    end
  end
end
