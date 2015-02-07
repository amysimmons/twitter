class AddDefaultValueToIsAdmin < ActiveRecord::Migration
  def change
    change_column :users, :is_admin, :boolean, :default => false
  end
end
