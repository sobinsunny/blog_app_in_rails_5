class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :author_id
      t.boolean :is_published
      t.timestamps
    end
  end
end
