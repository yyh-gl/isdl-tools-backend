class AddFlga < ActiveRecord::Migration[5.1]
  def change
    add_column :lives, :open, :boolean, :default => false
  end
end
