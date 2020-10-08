class AddNickNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nick_name, :string, null:false
    add_column :users, :family_name, :string, null: false
    add_column :users, :family_name_reading, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :first_name_reading, :string, null: false
    add_column :users, :birthday, :date, null: false
  end
end
