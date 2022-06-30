class AddUserIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user_id, :integer, foreign_key: true
    add_index :posts, :user_id
  end
end
