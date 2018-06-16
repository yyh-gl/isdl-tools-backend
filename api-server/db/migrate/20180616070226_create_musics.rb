class CreateMusics < ActiveRecord::Migration[5.1]
  def change
    create_table :musics do |t|
      t.string :name
      t.string :artist
      t.integer :genre, :default => 0
      t.integer :like, :default => 0
      t.boolean :intro, :default => false
      t.boolean :cross, :default => false
      t.text :text, :default => 'hoge'

      t.timestamps
    end
  end
end
