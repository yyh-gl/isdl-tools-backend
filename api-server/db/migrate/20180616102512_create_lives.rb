class CreateLives < ActiveRecord::Migration[5.1]
  def change
    create_table :lives do |t|
      t.integer :user_id
      t.string :name
      t.timestamp :date
      t.integer :like, :default => 0
      t.string :location
      t.integer :cd_price
      t.text :message
      t.timestamp :next_data

      t.timestamps
    end
  end
end
