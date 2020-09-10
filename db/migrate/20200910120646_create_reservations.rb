class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|

    	t.integer :customer_id, null:false
    	t.string :receipt_date
    	t.text :remark
    	t.integer :status, null:false, default: false

      t.timestamps
    end
  end
end
