class RemoveShirtSizeFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :shirt_size, :string
  end
end
