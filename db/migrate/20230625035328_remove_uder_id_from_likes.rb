class RemoveUderIdFromLikes < ActiveRecord::Migration[6.1]
  def change
    remove_column :likes, :uder_id
  end
end
