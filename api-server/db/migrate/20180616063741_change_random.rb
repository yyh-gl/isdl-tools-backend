class ChangeRandom < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :user_id, :string, :default => SecureRandom.hex(10)
  end
end
