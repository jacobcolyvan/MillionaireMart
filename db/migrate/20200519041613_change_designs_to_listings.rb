class ChangeListingsToListings < ActiveRecord::Migration[5.2]
  def change
    rename_table :listings, :listings
  end
end
