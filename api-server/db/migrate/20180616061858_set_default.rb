class SetDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :user_id, :string, :default => (0...8).map{ (65 + rand(26)).chr }.join
    change_column :users, :age, :integer, :default => 0
    change_column :users, :sex, :integer, :default => 0
    change_column :users, :job, :string, :default => 'none'
    change_column :users, :area, :string, :default => 'none'
    change_column :users, :password, :string, :default => 'hoge'
    change_column :users, :text, :text, :default => 'hoge'
    change_column :users, :artist, :boolean, :default => false
    change_column :users, :like, :integer, :default => 0
    change_column :users, :live_like, :integer, :default => 0
    change_column :users, :cross, :boolean, :default => false
  end
end
