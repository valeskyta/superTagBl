class AddColumsToUser < ActiveRecord::Migration
  def change
    add_column :users, :picture, :string
    add_column :users, :bio, :string
    add_column :users, :type, :integer
  end
end
