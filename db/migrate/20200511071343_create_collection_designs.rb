class CreateCollectionDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_designs do |t|
      t.references :design, foreign_key: true
      t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end
