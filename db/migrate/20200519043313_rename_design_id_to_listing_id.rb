class RenameDesignIdToListingId < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :design_id, :listing_id
  end
end
