class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

     t.integer "user_id", null:false
     t.integer "tag_id"
     t.integer "genre_id"
     t.string "name", null:false
     t.string "artist_name"
     t.text "explanation", null:false
     t.boolean "status", null:false
     t.string "img_id"
     t.string "distribute_place"
     t.datetime "distribute_date"

      t.timestamps
    end
  end
end
