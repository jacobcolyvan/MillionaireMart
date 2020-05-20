class RemoveCommentFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :comment, :text
  end
end
