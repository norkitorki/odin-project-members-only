class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
