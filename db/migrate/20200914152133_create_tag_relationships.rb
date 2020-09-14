class CreateTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_relationships do |t|

    	t.integer :tag_id, null:false
    	t.integer :item_id, null:false

      t.timestamps
    end
  end
end
