class ChangeKata < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :job, :integer, :default => 0
  end
end
