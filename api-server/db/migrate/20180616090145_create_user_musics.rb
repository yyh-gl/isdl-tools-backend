class CreateUserMusics < ActiveRecord::Migration[5.1]
  def change
    create_table :user_musics do |t|
      t.integer :user_id
      t.string :name
      t.string :artist
      t.integer :genre
      t.boolean :favorite, :default => false
      t.integer :like, :default => 0
      t.boolean :intro, :default => false
      t.boolean :cross, :default => false
      t.boolean :flag1, :default => false
      t.boolean :flag2, :default => false
      t.boolean :flag3, :default => false
      t.text :text, :default => 'hoge'

      t.timestamps
    end
  end
end
