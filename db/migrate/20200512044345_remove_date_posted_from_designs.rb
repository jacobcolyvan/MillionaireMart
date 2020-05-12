class RemoveDatePostedFromDesigns < ActiveRecord::Migration[5.2]
  def change
    remove_column :designs, :date_posted, :date
  end
end
