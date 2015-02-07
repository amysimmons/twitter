class AddDefaultValueToIsNews < ActiveRecord::Migration
  def change
    change_column :users, :is_news, :boolean, :default => false
  end
end
