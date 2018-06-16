class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_id
      t.integer :age
      t.integer :sex
      t.string :job
      t.string :area
      t.string :password
      t.text :text
      t.boolean :artist
      t.integer :like
      t.integer :live_like
      t.boolean :cross

      t.timestamps
    end
  end
end
