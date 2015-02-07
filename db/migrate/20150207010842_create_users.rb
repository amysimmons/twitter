class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :name
        t.string :email
        t.string :username
        t.string :password_digest
        t.text :bio
        t.string :organisation
        t.string :user_location
        t.text :profile_pic
        t.boolean :is_news
        t.boolean :is_admin
        t.timestamps
    end
  end
end

