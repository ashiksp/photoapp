class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :photo_id
      t.integer :album_id

      t.timestamps
    end
    add_index :comments, [:photo_id, :album_id, :created_at]
  end
end
