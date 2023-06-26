class RemoveDuplicatePostIdFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :post_id
    remove_index :likes, name: 'index_likes_on_uder_id_and_post_id', if_exists: true
  end
end
