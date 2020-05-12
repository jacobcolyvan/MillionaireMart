class AddCollectionToDesign < ActiveRecord::Migration[5.2]
  def change
    add_reference :designs, :collection, foreign_key: true
  end
end
