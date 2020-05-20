class ChangeDesignsToListings < ActiveRecord::Migration[5.2]
  def change
    rename_table :designs, :listings
  end
end
