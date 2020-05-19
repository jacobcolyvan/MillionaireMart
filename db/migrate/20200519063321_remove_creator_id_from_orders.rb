class RemoveCreatorIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :creatorID, :int
  end
end
