class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :liker_id, null: false
      t.integer :chirp_id, null: false
      t.timestamps
    end
    add_index :likes, [:chirp_id, :liker_id], unique: true
    #should only like a chirp for once, like/unlike,所以,只能有一个pair，like一个chirp就是一个pair，不可能有两个。
    # 这么写的话还是只有第一个被index了，
    add_index :likes, :liker_id
  end
end
