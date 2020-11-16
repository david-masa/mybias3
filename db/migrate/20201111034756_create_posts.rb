class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user
      t.string :title, null: false
      t.text :reason, null: false
      t.integer :category_id, default: 0
      t.string :youtube_url, null: false
      t.timestamps
    end
  end
end
