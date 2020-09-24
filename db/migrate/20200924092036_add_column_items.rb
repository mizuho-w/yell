class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :items, :distribute_date_fin, :datetime
  end
end
