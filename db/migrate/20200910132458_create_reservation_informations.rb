class CreateReservationInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_informations do |t|

    	t.integer :reservation_id, null:false

      t.timestamps
    end
  end
end
