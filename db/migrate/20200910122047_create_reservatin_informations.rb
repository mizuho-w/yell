class CreateReservatinInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservatin_informations do |t|

    	t.integer :item_id, null:false
    	t.integer :reservation_id, null:false

      t.timestamps
    end
  end
end
