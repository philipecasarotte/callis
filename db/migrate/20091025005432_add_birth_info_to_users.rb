class AddBirthInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :birthday, :date
    add_column :users, :avatar_file_name, :string
    add_column :users, :avatar_file_size, :integer
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_updated_at, :datetime
    add_column :users, :telephone, :string
    add_column :users, :department_id, :string
  end

  def self.down
    remove_column :users, :department_id
    remove_column :users, :telephone
    remove_column :users, :avatar_updated_at
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_file_name
    remove_column :users, :birthday
  end
end
