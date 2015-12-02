class AddColumsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :price, :float
    add_column :posts, :address, :string
    add_column :posts, :photo, :string
  end
end
